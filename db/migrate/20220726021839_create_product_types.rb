class CreateProductTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_types do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end
    add_index :product_types, :name, unique: true
  end
end
