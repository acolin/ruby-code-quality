class CreateAccount
  include ActiveModel::Model
  attr_accessor :email, :fullname, :address1, :city
  attr_accessor :user, :location
  
  validates :email, :fullname, :address1, :city, presence: true
  
  def call
    return false unless valid?
    
    begin
      ActiveRecord::Base.transaction do
        create_user
        create_location
      end
      send_welcome_notification
      true
    rescue => e
      errors.add(:base, 'There was a problem with the db, please try again later.')
      false
    end
  end
  
  private
  
  def create_user
    @user ||= User.create(email: email, fullname: fullname)
  end
  
  def create_location
    @location ||= Location.create(address1: address1, city: city)
  end
  
  def send_welcome_notification
    UserMailer.welcome_email(user).deliver_later
  end
end
