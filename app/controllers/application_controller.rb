class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :first_name, :last_name, :photo, :bio, :team_owner, :phone])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:photo, :bio, :team_owner, :phone])
  end
end
