class AddCityStateToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :integer 
  end
end
