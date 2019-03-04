class CartProductsController < ApplicationController
  def create
    @user_cart = current_user.cart
    @product_selected = Product.find(params[:product_id].to_i)
  end

  def destroy
  end
end
