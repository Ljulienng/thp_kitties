class Admins::ProductsController < ApplicationController

  def index
    @users = User.all
    @products = Product.all
    @orders = Order.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    product_params = params.permit(:title, :description, :price)

    if @product.update(product_params)
      @product.avatar.attach(params[:avatar])
      flash[:notice] = "The product was successfully modified"
      redirect_to admins_products_path
    else
      render :show
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admins_root_path
  end

 private

  def check_if_admin
    redirect_to root_path unless current_user.try(:admin?)
  end

end
