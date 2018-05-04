require 'rails_helper'

RSpec.describe "merchants/show", type: :view do
  before(:each) do
    @merchant = assign(:merchant, Merchant.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Website Url/)
    expect(rendered).to match(/Facebook/)
  end
end
