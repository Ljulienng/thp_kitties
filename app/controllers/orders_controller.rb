class OrdersController < ApplicationController
  before_action :authenticate_user!

  layout "application"
  def index
    @orders = current_user.orders
  end

  def create
    @cart = current_user.cart
    @total = 0
    @cart.products.each do |product|
    @total += product.price
    end

  

    @order = Order.new(user_id: current_user.id, total_price: @total)

    # Amount in cents
    @amount = @total*100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_i,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
    @order.cart = @cart
    
    if @order.save
      @cart.update(user_id: nil)  
      flash[:notice] = "order pass successfully"
      redirect_to root_path
    else 
      flash.now[:error] = "problem with your order"
      render "carts/show"
    end


    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to cart_path(@cart)
  end


end
