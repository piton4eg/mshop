class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :value, null: false

      t.timestamps
    end

    add_column :products, :popular, :boolean
  end
end
