require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    assign(:product, Product.create!(
      title: "Title",
      image_url: "Image Url",
      price: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/2/)
  end
end
