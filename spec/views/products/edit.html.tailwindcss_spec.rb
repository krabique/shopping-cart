require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  let(:product) {
    Product.create!(
      title: "MyString",
      image_url: "MyString",
      price: 1
    )
  }

  before(:each) do
    assign(:product, product)
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(product), "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "input[name=?]", "product[image_url]"

      assert_select "input[name=?]", "product[price]"
    end
  end
end
