class AddDiscountToCarts < ActiveRecord::Migration[8.0]
  def change
    add_column :carts, :discount, :integer
  end
end
