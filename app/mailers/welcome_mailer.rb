class WelcomeMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail to: @user.email, subject: 'Welcome to My Awesome Site', from: 'example@gmail.com'
  end
end
