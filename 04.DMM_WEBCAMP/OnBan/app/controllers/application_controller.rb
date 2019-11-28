class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # deviseで新規登録時に扱えるカラムを増やす
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :email, :postal_code, :first_name, :family_name_kana, :first_name_kana, :street_address, :phone_number])
    # deviseでユーザー情報をeditする際に扱えるカラムを増やす
    devise_parameter_sanitizer.permit(:account_update, keys: [:family_name, :email, :postal_code, :first_name, :family_name_kana, :first_name_kana, :street_address, :phone_number])
  end

  def after_sign_in_path_for(resource)
    items_path
  end
  
  def after_sign_out_path_for(resource)
    items_path
  end

end