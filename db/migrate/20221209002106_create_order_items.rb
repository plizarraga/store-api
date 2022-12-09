class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :product_item_id
      t.string :product_item_name
      t.string :product_item_picture_url
      t.decimal :price, precision: 5, scale: 2, null: false
      t.integer :quantity, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
