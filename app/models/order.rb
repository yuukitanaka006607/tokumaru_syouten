class Order < ApplicationRecord
  enum payment_method: { cash: 0, credit_card: 1 }
  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items
end
