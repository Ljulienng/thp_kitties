class Product < ApplicationRecord
  validates :price,
        presence: true,
        numericality: {greater_than: 0}
  validates :title,
        presence: true,
        length: { in: 3..30, message: "must be between 3 and 30 characters" }
  validates :description,
        presence: true,
        length: {in: 20..600, message: "must be between 20 and 600 characters"}


  has_many :cart_items, dependent: :destroy

end
