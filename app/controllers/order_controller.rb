class OrderController < ApplicationController
  after_save :delete_cart
  def new
    @order = Order.new(user_id: current_user, total_price: @@total)
  end

  def create
    # Amount in cents
    @amount = @@total*100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @@total,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path


  end

  def delete_cart
    current_user.cart.destroy
  end



end
