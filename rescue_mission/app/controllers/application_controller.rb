class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      questions_path
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    if resource.is_a?(User)
      new_user_session_path
    else
      super
    end
  end
end
