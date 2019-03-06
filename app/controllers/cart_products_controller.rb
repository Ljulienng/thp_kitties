class CartProductsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :is_product_already_used?, only: [:create]

  def create
    @user_cart = current_user.cart
    @product_selected = Product.find(params[:product_id])
    CartProduct.create(cart: @user_cart, product: @product_selected)
    flash[:notice] = "Product placed successfully in your cart"
    redirect_to products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    @cart = cart_product.cart
    cart_product.destroy
    redirect_to cart_path(@cart)
  end
end
