module SessionsHelper
  def flash_message(alert)
    if flash[:alert] 
      flash[:alert]
    end
  end
end