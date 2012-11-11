class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= guest_user
    return @current_user
  end

  def guest_user
    guest = User.where("email = ?", "guest")
    return guest.first if guest.size > 0
    guest = User.new()
    guest.email = "guest"
    guest.password = "a"
    guest.save
    return guest
  end

  helper_method :current_user

end
