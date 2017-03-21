class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images

  def sale_message
    if price.to_i < 20
      return "Discount Item!!!"
    else
      return "Everyday Deal!"
    end
  end

end
