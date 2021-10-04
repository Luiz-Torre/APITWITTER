class UserMailer < ActionMailer::Base
    default from: ENV["dev_email"]

  def registration_confirmation
    @user = params[:user]
    mail(to: @user.email, :subject => "Confirmação de Registro")
  end
end