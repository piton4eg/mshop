class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  validates :order_id, :product_id, :cart_id, :quantity, presence: true

  def total_price
    product.price * quantity
  end
end
