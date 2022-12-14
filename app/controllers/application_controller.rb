class ApplicationController < ActionController::Base
  before_action :config_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top]

  def after_sign_in_path_for(resource)
    books_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end