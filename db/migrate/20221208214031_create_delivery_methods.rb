class CreateDeliveryMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_methods do |t|
      t.string :short_name
      t.string :description
      t.string :delivery_time
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
