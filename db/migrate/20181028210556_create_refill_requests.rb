class CreateRefillRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :refill_requests do |t|
      t.integer :prescription_id
      t.integer :store_id
      t.string :customer_id

      t.timestamps
    end
  end
end
