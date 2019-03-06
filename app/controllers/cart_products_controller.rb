class CartProductsController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!, only: [:create, :destroy]
=======
  before_action :authenticate_user!
>>>>>>> 1572a90929ad4d0d3d7cd28ee1d5f1cf906b0473

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
