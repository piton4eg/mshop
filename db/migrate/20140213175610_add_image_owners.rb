class AddImageOwners < ActiveRecord::Migration
  def up
    change_table :images do |t|
      t.rename :product_id, :owner_id
      t.string :owner_type, null: false, default: 'Product'
    end
  end

  def down
    change_table :images do |t|
      t.remove :owner_type
      t.rename :owner_id, :product_id
    end
  end
end
