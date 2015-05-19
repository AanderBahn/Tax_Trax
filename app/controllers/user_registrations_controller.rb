class UserRegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => {:create}

protected

 def configure_permitted_parameters
  devise_parameters_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :avatar, :phone)}
 end

end
