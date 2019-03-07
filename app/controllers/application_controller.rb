class ApplicationController < ActionController::Base
    before_action :if_current_cart_exist?
    before_action :progress_bar

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

  def progress_bar
    if user_signed_in?
      @progress_status = 0
      unless current_user.first_name.nil?
        unless current_user.first_name.empty?
          @progress_status += 25
        end  
      end
      unless current_user.last_name.nil?
        unless current_user.last_name.empty?
          @progress_status += 25
        end  
      end
      unless current_user.user_name.nil?
        unless current_user.user_name.empty?
          @progress_status += 25
        end
      end
      unless current_user.description.nil?
        unless current_user.description.empty?
          @progress_status += 25
        end
  
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
end
