class Order < ApplicationRecord
<<<<<<< HEAD
  has_one :user
  has_many :cart_products
  after_create :confirm_order

  def confirm_order
    UserMailer.order_email(self).deliver_now
  end

=======
  belongs_to :user
  belongs_to :cart
>>>>>>> 7c218f6a4eec6c33d1e1388325d3f74f01f16b2c
end
