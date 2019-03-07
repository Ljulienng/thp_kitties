class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  validates :cart, presence: true
  validates :user, presence: true
  #after_create :confirm_order

  def confirm_order
    UserMailer.order_email(self).deliver_now
  end

end
