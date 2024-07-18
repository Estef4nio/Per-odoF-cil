require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :http_cache

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def periodo_present?
    if not current_user.periodo 
      session[:to] = "disciplina"
      redirect_to new_periodo_path
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
