class CreateJoinTableCartProduct < ActiveRecord::Migration[8.0]
  def change
    create_join_table :carts, :products do |t|
      t.index [:cart_id, :product_id], unique: true
      t.integer :quantity, null: false
    end
  end
end
