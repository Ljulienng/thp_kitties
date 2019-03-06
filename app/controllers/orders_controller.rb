class OrdersController < ApplicationController
  def new
  end

  def create
    @cart = Cart.find(params[:cart_id])
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
    @order.save
    current_user.cart.destroy
    redirect_to root_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to cart_path(@cart)


  end


end
