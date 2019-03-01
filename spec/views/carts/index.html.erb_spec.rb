require 'rails_helper'

RSpec.describe "carts/index", type: :view do
  before(:each) do
    assign(:carts, [
      Cart.create!(
        :user => nil,
        :product => nil,
        :purchased => false
      ),
      Cart.create!(
        :user => nil,
        :product => nil,
        :purchased => false
      )
    ])
  end

  it "renders a list of carts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
