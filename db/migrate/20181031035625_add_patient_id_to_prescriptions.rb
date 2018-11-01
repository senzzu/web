class AddPatientIdToPrescriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :prescriptions, :patient_id, :integer
  end
end
