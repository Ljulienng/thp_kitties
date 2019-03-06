class CartProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user_cart = current_user.cart
    @product_selected = Product.find(params[:product_id])
    CartProduct.create(cart: @user_cart, product: @product_selected)
    redirect_to root_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    @cart = cart_product.cart
    cart_product.destroy
    redirect_to cart_path(@cart)
  end
end
