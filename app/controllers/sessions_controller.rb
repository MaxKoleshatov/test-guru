class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      cookies.delete :current_url if redirect_to cookies[:current_url] || tests_path
    else
      flash.now[:errors_mail_password] = 'Введите свою электронную почту и пароль'
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
