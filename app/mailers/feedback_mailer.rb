class FeedbackMailer < ApplicationMailer
    def send_message(user, message)
     @user = user.email
     @message = message
     
 
     mail(to: Admin.all.map(&:email) , subject: "Message from #{@user}")
    end
 end