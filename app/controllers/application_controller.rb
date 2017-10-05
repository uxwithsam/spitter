class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected #this is protected, anything below this we can't call

  def configure_permitted_parameters #this is a method inside the application controller class
    #so we can't call it, but we need these sanitizers to be executed. So we trick it. 
    #So we tell it, BEFORE ANY ACTIONS HAPPEN, run this method first, the before_action above.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :bio, :location])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :bio, :location])
  end
end
