require 'rails_helper'

RSpec.describe "deals/edit", type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
      :title => "MyString",
      :description => "MyText",
      :image_data => "MyText",
      :original_price => "9.99",
      :offer_price => "9.99",
      :quantity => 1,
      :voucher_limit_per_user => 1,
      :charge_id => "MyString"
    ))
  end

  it "renders the edit deal form" do
    render

    assert_select "form[action=?][method=?]", deal_path(@deal), "post" do

      assert_select "input[name=?]", "deal[title]"

      assert_select "textarea[name=?]", "deal[description]"

      assert_select "textarea[name=?]", "deal[image_data]"

      assert_select "input[name=?]", "deal[original_price]"

      assert_select "input[name=?]", "deal[offer_price]"

      assert_select "input[name=?]", "deal[quantity]"

      assert_select "input[name=?]", "deal[voucher_limit_per_user]"

      assert_select "input[name=?]", "deal[charge_id]"
    end
  end
end
