class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!
  # before_action :configure_account_update_params, if: :devise_controller?, only: [:update]

  # TO ADD FIELDS AT SIGN UP (e.g. first name, last name, username, etc.)
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   # For additional fields in app/views/devise/registrations/new.html.erb
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])

  #   # For additional in app/views/devise/registrations/edit.html.erb
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name])
  # end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_out_path_for(resource)
    recipes_path
  end

  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :photo, :photo_cache])
  # end
end
