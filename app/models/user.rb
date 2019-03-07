class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #after_create :welcome_send

  

  has_one :cart
  has_many :orders
  has_one_attached :avatar

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def name
    if self.first_name && self.last_name
      self.first_name + " " + self.last_name
    else
      self.first_name
    end
  end
end
