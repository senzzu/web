class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      t.string :street_address, default: ''
      t.string :town, default: ''
      t.string :state, default: ''
      t.string :zipcode, default: ''
      t.string :phone_number, default: ''
      t.string :profile_picture, default: 'https://media.licdn.com/dms/image/C4E03AQGvALsbkwZrEQ/profile-displayphoto-shrink_200_200/0?e=1546473600&v=beta&t=JR-Ju_9KqrtTLPQyzgTSwGMcqTEesE_7mxU4YhRDJC8'

      t.timestamps
    end
  end
end
