class ChangePaymentIntentIdToStringInOrdersTable < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :payment_intent_id, :string
    add_index :orders, :payment_intent_id, unique: true
  end
end
