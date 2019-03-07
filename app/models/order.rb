class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  after_create :confirm_order

  def confirm_order
    UserMailer.order_email(self).deliver_now
  end

end
