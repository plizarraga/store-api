class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :buyer_email, null: false
      t.datetime :order_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :ship_to_address_first_name, null: false
      t.string :ship_to_address_last_name, null: false
      t.string :ship_to_address_street, null: false
      t.string :ship_to_address_city, null: false
      t.string :ship_to_address_state, null: false
      t.string :ship_to_address_zipcode, null: false
      t.references :delivery_method, null: false, foreign_key: true
      t.decimal :subtotal, null: false
      t.integer :status, null: false, default: 0
      t.integer :payment_intent_id, null: true

      t.timestamps
    end
  end
end
