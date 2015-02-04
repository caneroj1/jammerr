class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, default: ""
  end
end
