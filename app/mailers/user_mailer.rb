class UserMailer < ActionMailer::Base
  default from: " service@eliving.co"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm.subject
  #
  def confirm(email, mail_params)
    @user_name = mail_params[:user_name]
    @event_title = mail_params[:event_title]

    mail to: email, subject: "go.dev 客戶留言通知信"
  end
end
