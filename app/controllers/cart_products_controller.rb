class CartProductsController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!
=======
  before_action :authenticate_user!, only: [:create, :destroy]
>>>>>>> 4f22553651d91465b4263d5a887349edb220ee6d

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
