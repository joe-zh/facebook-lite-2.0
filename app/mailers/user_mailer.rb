class UserMailer < ApplicationMailer
  default from: "cis196@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_greeting_mail.subject
  #
  def send_greeting_mail(current_user, user)
    @user = user
    @curr = current_user
    mail(:to => @user.email, :subject => 'Hello!')
  end
end
