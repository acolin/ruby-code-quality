class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_current_event, :except => [:index, :new, :create, :subdomain_availability, :destroy_sponsor]
  authorize_resource :event

  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @location = @event.location ? @event.location : Location.new
    @contact = @event.contact ? @event.contact : Contact.new
    @event.sponsors.build

    respond_to do |format|
      format.html
    end
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @event = Event.new(params[:event])
    @event.owner = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: 'Event was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  def update
    @location = @event.location ? @event.location : Location.new
    @contact = @event.contact ? @event.contact : Contact.new

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to event_url(@event) }
      else
        format.html { render action: "show" }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
    end
  end

  # Custom actions
  def destroy_logo
    @event.remove_logo = true
    @event.save

    redirect_to event_url(@event)
  end

  def destroy_sponsor
    @sponsor = Sponsor.find_by_event_id_and_id(params[:event_id], params[:id])
    @sponsor.destroy

    respond_to do |wants|
      wants.html { redirect_to event_url(params[:event_id]) }
    end

  end

  def update_contact
    @event.contact ? @event.contact.update_attributes(params[:contact]) : @event.build_contact(params[:contact]).save

    respond_to do |wants|
      wants.html { redirect_to event_url(@event) }
    end

  end

  def update_location
    @event.location ? @event.location.update_attributes(params[:location]) : @event.build_location(params[:location]).save

    respond_to do |wants|
      wants.html { redirect_to event_url(@event) }
    end

  end

  def update_fee_breakdown
    state = params[:state].to_i
    @event.update_fee_breakdown(state)

    respond_to do |wants|
      wants.js
    end
  end

  #verifies if a subdomain is available
  def subdomain_availability
    subdomain = params[:event][:subdomain]
    @event = params[:event_id]
    response = Event.subdomain_available?(@event, subdomain)

    respond_to do |wants|
      wants.json { render json: "#{response}" }
    end
  end

  #changes the event registration status open/close
  def toggle_registration
    @event.toggle! :registration_open

    respond_to do |wants|
      wants.json { render json: "#{event.registration_open}" }
    end
  end

  def activate
    @event.activate(current_user)
    respond_to do |format|
      format.html { redirect_to event_path @event }
      format.js
    end
  end

  def deactivate
    @event.update_attributes activated_at: nil
    respond_to do |format|
      format.html { redirect_to event_path @event }
    end
  end

  def add_phone
    respond_to do |format|
      if params[:user][:phone_number].blank?
        format.html { redirect_to :back }
      else
        @event.owner.update_attributes phone_number: params[:user][:phone_number]
        format.html { redirect_to event_path @event }
      end
    end
  end

end
