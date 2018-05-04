require 'rails_helper'

RSpec.describe "merchants/index", type: :view do
  before(:each) do
    assign(:merchants, [
      Merchant.create!(
        :user_id => nil,
        :name => "Name",
        :description => "MyText",
        :street => "Street",
        :city => "City",
        :state => "State",
        :postcode => "Postcode",
        :latitude => "9.99",
        :longitude => "9.99",
        :website_url => "Website Url",
        :facebook_id => "Facebook"
      ),
      Merchant.create!(
        :user_id => nil,
        :name => "Name",
        :description => "MyText",
        :street => "Street",
        :city => "City",
        :state => "State",
        :postcode => "Postcode",
        :latitude => "9.99",
        :longitude => "9.99",
        :website_url => "Website Url",
        :facebook_id => "Facebook"
      )
    ])
  end

  it "renders a list of merchants" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Website Url".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
  end
end
