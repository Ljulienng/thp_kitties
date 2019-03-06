class ApplicationController < ActionController::Base
    before_action :if_current_cart_exist?

  def is_product_already_used?
    @user = current_user
    @product_selected = Product.find(params[:product_id])
    @user.cart.products.each do |product|
      if product == @product_selected
        flash[:danger] = "this product is arleady in the cart"
        redirect_to products_path
      end
    end
  end


  def if_current_cart_exist?
    if user_signed_in?
      if current_user.cart == nil
        current_user.cart  = Cart.create(user: current_user)
      end
    end
  end

  def correct_user
    if current_user.cart != @cart
      flash[:danger] = "Incorrect cart"
      redirect_to '/'
    end
  end

end

