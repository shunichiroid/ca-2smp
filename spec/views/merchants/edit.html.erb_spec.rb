require 'rails_helper'

RSpec.describe "merchants/edit", type: :view do
  before(:each) do
    @merchant = assign(:merchant, Merchant.create!(
      :user_id => nil,
      :name => "MyString",
      :description => "MyText",
      :street => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postcode => "MyString",
      :latitude => "9.99",
      :longitude => "9.99",
      :website_url => "MyString",
      :facebook_id => "MyString"
    ))
  end

  it "renders the edit merchant form" do
    render

    assert_select "form[action=?][method=?]", merchant_path(@merchant), "post" do

      assert_select "input[name=?]", "merchant[user_id_id]"

      assert_select "input[name=?]", "merchant[name]"

      assert_select "textarea[name=?]", "merchant[description]"

      assert_select "input[name=?]", "merchant[street]"

      assert_select "input[name=?]", "merchant[city]"

      assert_select "input[name=?]", "merchant[state]"

      assert_select "input[name=?]", "merchant[postcode]"

      assert_select "input[name=?]", "merchant[latitude]"

      assert_select "input[name=?]", "merchant[longitude]"

      assert_select "input[name=?]", "merchant[website_url]"

      assert_select "input[name=?]", "merchant[facebook_id]"
    end
  end
end
