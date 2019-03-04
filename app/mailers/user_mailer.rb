class UserMailer < ApplicationMailer
  default from: 'no-reply@kitties.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'http://kitties.fr/login' 

    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def order_send(user)
    @order = user.cart.products
    @user = user 
    mail(to: @user.email, subject: 'Your order !') 

end