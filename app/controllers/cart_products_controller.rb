class CartProductsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @user_cart = current_user.cart
    @product_selected = Product.find(params[:product_id].to_i)
  end

  def destroy
    cp = CartProduct.find(params[:id])
    cp.destroy
    redirect_to root_path
  end
end
