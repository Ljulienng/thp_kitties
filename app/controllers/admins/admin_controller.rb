class Admins::AdminController < ApplicationController
  before_action :check_if_admin

  def index
    @users = User.all
    @products = Product.all
    @orders = Order.all
  end

  private

  def check_if_admin
    unless current_user.try(:admin?)
      flash[:danger] = "You're not allowed to see this page"
      redirect_to root_path
    end
  end
end
