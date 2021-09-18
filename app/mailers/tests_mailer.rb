class TestsMailer < ApplicationMailer
   def completed_test(test_user)
    @user = test_user.user
    @test = test_user.test
    @test_user = test_user

    mail to: @user.email, subject: 'Вы закончили тест'
   end
end
