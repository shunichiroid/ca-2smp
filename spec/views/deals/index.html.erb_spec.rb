require 'rails_helper'

RSpec.describe "deals/index", type: :view do
  before(:each) do
    assign(:deals, [
      Deal.create!(
        :title => "Title",
        :description => "MyText",
        :image_data => "MyText",
        :original_price => "9.99",
        :offer_price => "9.99",
        :quantity => 2,
        :voucher_limit_per_user => 3,
        :charge_id => "Charge"
      ),
      Deal.create!(
        :title => "Title",
        :description => "MyText",
        :image_data => "MyText",
        :original_price => "9.99",
        :offer_price => "9.99",
        :quantity => 2,
        :voucher_limit_per_user => 3,
        :charge_id => "Charge"
      )
    ])
  end

  it "renders a list of deals" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Charge".to_s, :count => 2
  end
end
