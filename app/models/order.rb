class Order < ApplicationRecord
  has_one :user
  has_many :cart_products
end
