class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number,
                                                       :city, :postcode, :password,
                                                       :password_confirmation, :category, :artist_name,
                                                       { event_types: [] } ])
  end

  def after_sign_in_path_for(resource)
    return super if resource.is_a?(User)

    if resource.sign_in_count == 1
      first_edit_path
    else
      dashboard_path
    end
  end
end
