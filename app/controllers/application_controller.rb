class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # devise :database_authenticatable, :registerable,
  #   :recoverable, :rememberable, :trackable, :validatable,
  #   :confirmable


  # def current_user
  #   @user ||= User.first
  # end
  # helper_method :current_user

end
