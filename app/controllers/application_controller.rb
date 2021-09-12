class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  private
  def authenticate_user!
    unless current_user
      cookies[:current_url] = request.original_url 
      redirect_to login_path, alert: 'Введите свою электронную почту и пароль'
    end
    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
