class UserMailer < ApplicationMailer
  default from: 'florentbilocq@yopmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://kitties.fr/login'

    mail(to: @user.email, subject: 'Welcome to Kitten Project !')
  end

  def order_email(order)
    @user = order.user

    @url = 'http://kittiesfr/login'

    mail(to: @user.email, subject: 'Your Kitten order')
  end
end
