class PasswordResetMailer < ApplicationMailer
  def reset_mail
    @user = params[:user]
    mail to: @user.email, subject: 'Сброс пароля | Буккросинг'
  end
end