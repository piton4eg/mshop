class CreateCartsAndLines < ActiveRecord::Migration
  def change
    add_index :products, :name, unique: true

    create_table :carts do |t|
      t.timestamps
    end

    create_table :line_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
