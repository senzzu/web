class AddDetailsToShoppers < ActiveRecord::Migration[5.0]
  def change
    add_column :shoppers, :first_name, :string, default: ''
    add_column :shoppers, :last_name, :string, default: ''
    add_column :shoppers, :street_address, :string, default: ''
    add_column :shoppers, :town, :string, default: ''
    add_column :shoppers, :state, :string, default: ''
    add_column :shoppers, :zipcode, :string, default: ''
    add_column :shoppers, :phone_number, :string, default: ''
    add_column :shoppers, :profile_picture, :string, default: 'https://media.licdn.com/dms/image/C4E03AQGvALsbkwZrEQ/profile-displayphoto-shrink_200_200/0?e=1546473600&v=beta&t=JR-Ju_9KqrtTLPQyzgTSwGMcqTEesE_7mxU4YhRDJC8'
  end
end
