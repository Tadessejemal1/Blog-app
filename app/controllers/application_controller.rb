class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler
  
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :photo, :bio, :password, :current_password)
    end
  end

  def authorize_request
    header = request.headers['Auth']
    header = header.split.last if header
    begin
      @decoded = JsonWebToken.decode(header)
      p @decoded
      @current_user = User.find(@decoded['id'])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end

end
