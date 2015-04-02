class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate if Rails.application.config.password_protected

  def authenticate
    authenticate_or_request_with_http_basic(t(:http_challenge)) do |username, password|
      username == Rails.application.config.auth_user and password == Rails.application.config.auth_password
    end
  end
end
