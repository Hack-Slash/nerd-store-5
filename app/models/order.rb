class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products

  def calculate_totals
    # take all the carted products for this order
    # add up all the tax, total and subtotal amounts
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    # actually change this instance of order
    update(tax: tax, total: total, subtotal: subtotal)
  end
end
