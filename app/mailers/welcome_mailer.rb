class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_when_create.subject
  #
  def send_when_create(user)
    @user = user
    mail  to: @user.email,
          subject: "登録が完了しました"
  end
end
