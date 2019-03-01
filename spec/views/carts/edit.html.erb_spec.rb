require 'rails_helper'

RSpec.describe "carts/edit", type: :view do
  before(:each) do
    @cart = assign(:cart, Cart.create!(
      :user => nil,
      :product => nil,
      :purchased => false
    ))
  end

  it "renders the edit cart form" do
    render

    assert_select "form[action=?][method=?]", cart_path(@cart), "post" do

      assert_select "input[name=?]", "cart[user_id]"

      assert_select "input[name=?]", "cart[product_id]"

      assert_select "input[name=?]", "cart[purchased]"
    end
  end
end
