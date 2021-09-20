class SessionsController < Devise::SessionsController
    before_action :authenticate_user!
    def create
      super
      flash[:notice] = "Hello, #{@user.first_name}!"
    end
  end