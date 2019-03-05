class UserMailer < ApplicationMailer
  default from: 'florentbilocq@yopmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://kitties.fr/login'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
