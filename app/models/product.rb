class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  def sale_message
    if price.to_i < 20
      return "Discount Item!!!"
    else
      return "Everyday Deal!"
    end
  end

end
