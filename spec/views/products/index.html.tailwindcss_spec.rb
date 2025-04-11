require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        title: "Title",
        image_url: "Image Url",
        price: 2
      ),
      Product.create!(
        title: "Title",
        image_url: "Image Url",
        price: 2
      )
    ])
  end

  it "renders a list of products" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Image Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
