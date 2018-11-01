class CreateCoverages < ActiveRecord::Migration[5.0]
  def change
    create_table :coverages do |t|
      t.string :carrier, default: ''
      t.string :member_id, default: ''
      t.string :provider_name, default: ''
      t.string :provider_phone, default: ''
      t.string :rx_bin, default: ''
      t.string :rx_group, default: ''
      t.float :generic_copay, default: 0.0
      t.float :brand_copay, default: 0.0
      t.float :otc_copay, default: 0.0
      t.integer :shopper_id
      t.string :customer_id, default: ''
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
