class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  def index
    # if params[:attribute] && params[:order]
    #   @products = Product.order(params[:attribute] => params[:order])
    # elsif params[:search_term]
    #   @products = Product.where("name LIKE ?", "%#{params[:search_term]}%")
    # else
    #   @products = Product.all
    # end

    # if params[:discount]
    #   @products = Product.where("price < ?", "20")
    # end
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    else
      @products = Product.all
    end
  end

  def new
    @suppliers = Supplier.all
    @product = Product.new
  end

  def create
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id]
    )

    image1 = Image.new(url: params[:url])
    if @product.save && image1.save
      flash[:success] = "Product Created"
      redirect_to "/products/#{@product.id}"
    else
      @suppliers = Supplier.all
      render 'new.html.erb'
    end
  end

  def show
    if params[:id] == 'random'
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
    @suppliers = Supplier.all
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @suppliers = Supplier.all
    if @product.update(
         name: params[:name],
         description: params[:description],
         price: params[:price]
       )
      flash[:success] = "Product Updated"
      redirect_to "/products/#{@product.id}"
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    flash[:warning] = "Product Created"
    redirect_to "/"
  end
end

