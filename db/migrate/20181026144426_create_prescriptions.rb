class CreatePrescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptions do |t|
      t.string :med_name, default: ''
      t.datetime :filled_on
      t.string :prescriber, default: ''
      t.string :filled_by, default: ''
      t.integer :pharmacy_id
      t.string :customer_id, default: ''

      t.timestamps
    end
  end
end
