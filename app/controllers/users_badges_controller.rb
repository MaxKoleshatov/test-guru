class UsersBadgesController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @user_badges = current_user.users_badges
    end  
end