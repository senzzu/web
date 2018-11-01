class CreateHealthAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :health_alerts do |t|
      t.string :alert_type, default: ''
      t.string :content, default: ''
      t.integer :pharmacy_id
      t.boolean :read, default: false
      t.string :customer_id, default: ''

      t.timestamps
    end
  end
end
