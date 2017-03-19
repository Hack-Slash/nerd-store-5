class Product < ActiveRecord::Base
  belongs_to :supplier
  # Create a model method called sale_message that does as follows: If an item is under $2, it returns the string “Discount Item!” - otherwise, it should return the string “Everyday Value!!” Then, have this message appear on the product’s show page.
  def sale_message
    if price.to_i < 20
      return "Discount Item!!!"
    else
      return "Everyday Deal!"
    end
  end

end
