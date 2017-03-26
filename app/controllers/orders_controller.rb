class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    price = product.price.to_i
    quantity = params[:quantity].to_i
    tax = 0.08875 * price * quantity
    subtotal = price * quantity
    total = tax + total
    order1 = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
    )

    order1.save
    redirect_to "/orders/#{order1.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
