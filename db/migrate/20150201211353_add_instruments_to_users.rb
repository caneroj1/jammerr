class AddInstrumentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instruments, :text, default: []
  end
end
