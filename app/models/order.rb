class Order < ApplicationRecord
  has_one :user
  has_many :cart_products
  after_create :confirm_order

  def confirm_order
    UserMailer.order_email(self).deliver_now
  end

end
