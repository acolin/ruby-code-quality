class Event < ActiveRecord::Base
  RESERVED_SUBDOMAINS = %w( www  ftp mail api assets blog admin calendar )
  attr_accessible :name, :subdomain, :about, :start_date, :end_date, :time_zone, :logo,
                  :banner, :logo_cache, :banner_cache, :preferred_currency, :preferred_name_is_visible,
                  :remove_logo, :registration_open, :capacity, :event_type, :activated_at, :private

  attr_accessible :location_attributes, :sponsors_attributes, :contact_attributes
  attr_accessible :preferred_name_is_visible, :preferred_currency, :preferred_fee_breakdown

  belongs_to :owner, :foreign_key => 'user_id', :class_name => 'User', counter_cache: true
  belongs_to :venue
  has_one :location
  has_one :contact
  has_many :sponsors
  has_many :ticket_types
  has_many :payment_methods
  has_many :bookings
  
  accepts_nested_attributes_for :sponsors, :contact, :location

  default_scope lambda { order('events.start_date ASC') }
  scope :with_subdomain, lambda { |subdomain| find_by_subdomain(subdomain).joins(:location, :contact, :sponsors) }
  scope :created_last_week, -> do
    start_date = Date.today.beginning_of_week - 7.days
    end_date = Date.today
    where created_at: start_date..end_date
  end
  scope :checkinable, -> { where('end_date > ? and activated_at is not null', Time.now).order('created_at DESC') }
  scope :activated_and_current, -> { where('end_date > ?', Time.now).where('activated_at IS NOT NULL').order(:id) }
  scope :not_activated_and_current, -> { where('end_date > ?', Time.now).where('activated_at IS NULL') }
  scope :with_ticket_registration_form, -> { joins(:ticket_registration_form) }
  scope :over, -> { where('end_date < ?', Time.now) }
  scope :not_over, -> { where('Date(events.end_date) = ?', DateTime.tomorrow) }
  scope :by_user, -> (user_id) { where('user_id = ? ', user_id).select { |e| e.active? } }

  validates :name, :subdomain, :presence => true
  validates :subdomain, :length => {:maximum => 40}
  validates_uniqueness_of :subdomain
  validates_exclusion_of :subdomain, :in => RESERVED_SUBDOMAINS
  validates :logo, :file_size => {:maximum => 1.megabyte.to_i}, :on => :update, :allow_blank => true
  validates :banner, :file_size => {:maximum => 1.megabyte.to_i}, :on => :update, :allow_blank => true
  validates_datetime :end_date, :after => :start_date, :on => :update, :allow_blank => true
  validates :capacity, numericality: {greater_than: 0, allow_blank: true}

  after_create :send_new_event_notification

  class << self
    def public
      where(private: false)
    end

    def private
      where(private: true)
    end

    def filter_for_user(user, params)
      return Event.page(params[:page]).per 15 if user.super_admin?
      return user.events
    end

    def event_types
      [
          'Congreso / Conferencia',
          'Taller / Curso',
          'Deportivo / De resistencia',
          'Musical',
          'Comunidad / Networking',
          'Comida y Bebida',
          'Recaudación de fondos',
          'Político',
          'Otro'
      ]
    end

    def subdomain_available?(event_id=nil, subdomain)
      event_id ||= -1
      stripped_subdomain = subdomain.strip

      return false if RESERVED_SUBDOMAINS.include?(stripped_subdomain)
      return !where("id != ? AND subdomain = ?", event_id, stripped_subdomain).any?
    end
  end

  # Instance methods
  def over?
    end_date.try(:<, Time.now)
  end

  def tickets_sold_out?
    available_tickets.empty? && bookings.pending.empty?
  end

  def no_tickets_available?
    available_tickets.empty? && bookings.pending.any?
  end

  # Gets the event full subdomain i.e. my-event.boletia.com
  def url
    uri = URI(Settings.app_host)
    '%s://%s.%s' % [uri.scheme, self.subdomain, uri.host]
  end

  def ready_for_sales?(current_user = nil)
    has_only_free_tickets? || (has_paid_tickets? && has_payment_methods?(current_user))
  end

  def update_fee_breakdown(state)
    unless self.bookings.after_cart.any?
      new_state = state == 1 ? true : false
      self.preferred_fee_breakdown = new_state
      self.save
    end
  end

  def activate(current_user = nil)
    return I18n.t("messages.no_payment_methods") if has_paid_tickets_and_no_payment_method?(current_user)
    return I18n.t("messages.no_ticket_types") if available_tickets.empty?
    self.update_attributes(activated_at: DateTime.now) if ready_for_sales?(current_user)
  end

  def get_current_state(current_user = nil)
    return 'data-incomplete' if data_incomplete?
    return 'no-tickets' if available_tickets.empty?
    return 'no-payment-method' if has_paid_tickets_and_no_payment_method?(current_user)
    return 'non-active' if ready_for_sales?(current_user) && !active?(current_user)
    return 'phone-number' if ready_for_sales?(current_user) && owner.phone_number.nil? && active?(current_user)
    return 'active' if ready_for_sales?(current_user) && owner.phone_number && active?(current_user)
  end

  def active?(current_user = nil)
    !!activated_at && ready_for_sales?(current_user)
  end

  private

  def available_tickets
    available_tickets ||= Boletia::TicketsAvailability::ForEvent.new(event_id: id).call
  end

  def has_paid_tickets_and_no_payment_method?(current_user = nil)
    has_paid_tickets? && !has_payment_methods?(current_user)
  end

  def send_new_event_notification
    EventMailer.new_event_notification(self.id).deliver
  end

  def has_payment_methods?(current_user=nil)
    payment_methods.active(current_user, self).any?
  end

  def has_paid_tickets?
    available_tickets.any? { |t| !t.free }
  end

  def has_only_free_tickets?
    return false if has_paid_tickets?
    available_tickets.any? { |t| t.free }
  end

end