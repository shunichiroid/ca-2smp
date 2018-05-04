require 'rails_helper'

RSpec.describe "deals/show", type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
      :title => "Title",
      :description => "MyText",
      :image_data => "MyText",
      :original_price => "9.99",
      :offer_price => "9.99",
      :quantity => 2,
      :voucher_limit_per_user => 3,
      :charge_id => "Charge"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Charge/)
  end
end
