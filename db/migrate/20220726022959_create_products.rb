class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.text :description, default: ""
      t.string :price
      t.references :product_type, null: false, foreign_key: true
      t.references :product_brand, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
