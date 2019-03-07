class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  validates :cart, presence: true
  validates :user, presence: true
  #after_create :confirm_order
  #after_create :confirm_order_admin
  
  def confirm_order
    UserMailer.order_email(self).deliver_now
  end

  def confirm_order_admin
    UserMailer.order_email_admin(self).deliver_now
  end

end
