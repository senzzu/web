class CreateBillingHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :billing_histories do |t|
      t.string :amount, default: ''
      t.string :memo, default: ''
      t.datetime :paid_on
      t.integer :pharmacy_id
      t.string :paid_to, default: ''
      t.string :payment_method, default: ''
      t.string :last_4, default: ''
      t.string :customer_id, default: ''

      t.timestamps
    end
  end
end
