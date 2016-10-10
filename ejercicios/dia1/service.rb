class CreateAccount
  include ActiveModel::Model
  attr_accessor :email, :fullname, :address1, :city
  attr_accessor :user, :location
  
  validates :email, :fullname, :address1, :city, presence: true
  
  def persist!
    return false unless valid?
    
    create_user
    create_location
    send_welcome_notification
    true
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
