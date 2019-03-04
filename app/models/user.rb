class User < ApplicationRecord
  after_create :welcome_send
  after_create :order_send


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def order_send
    UserMailer.order_email(self).deliver_now
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  has_one_attached :avatar
end
