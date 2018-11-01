class AddPrescriptionIdToBillingHistories < ActiveRecord::Migration[5.0]
  def change
    add_column :billing_histories, :prescription_id, :integer
    add_column :prescriptions, :url, :string
    add_column :prescriptions, :store_id, :integer
    add_column :prescriptions, :refills_left, :integer, default: 0
  end
end
