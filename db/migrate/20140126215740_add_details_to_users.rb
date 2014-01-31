class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :employee, :boolean, default: false
  end
end