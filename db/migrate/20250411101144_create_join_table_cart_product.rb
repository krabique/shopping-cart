class CreateJoinTableCartProduct < ActiveRecord::Migration[8.0]
  def change
    create_join_table :carts, :products do |t|
      t.primary_key :id
      t.integer :quantity, null: false
      t.index [:cart_id, :product_id], unique: true
    end
  end
end
