class FeedbackController < ApplicationController
  before_action :authenticate_user!
  
  def index;end

  def create
    message = params[:text]

    if message.empty?
      render :index
    else
      FeedbackMailer.send_message(current_user, message).deliver_now
      redirect_to root_path
    end
  end
end