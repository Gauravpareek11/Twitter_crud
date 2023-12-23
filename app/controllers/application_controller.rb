class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_method
  helper_method :current_user

  def not_found_method
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path, flash: { success: 'Please Sign In' } unless current_user
  end
  def logged_in
    redirect_to root_path, flash: { error: 'Already Signed In' } if current_user
  end
end
