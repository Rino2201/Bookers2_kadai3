class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    about_path
  end
  # ログイン後は'/users/;id'へ!!
  # 未変更1/23

  def after_sign_out_path_for(resource)
    about_path
  end
  # ログアウト後は'homes#top' '/'へ!!
  # 未変更1/23

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
