class UserMailer < ApplicationMailer
  def confirmation_instructions(user)
    @user = user
    mail(to: user.email)
  end
end
