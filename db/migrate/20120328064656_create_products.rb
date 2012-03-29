class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :album
      t.string :artist
      t.text :description
      t.integer :qty
      t.float :price
      t.boolean :on_sale
      t.float :sale_price

      t.timestamps
    end
  end
end
