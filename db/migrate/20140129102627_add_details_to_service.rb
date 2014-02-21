class AddDetailsToService < ActiveRecord::Migration
  def change
    add_column :services, :price, :decimal, precision: 5, scale: 2, default: 20
    add_column :services, :duration, :integer, default: 30
    add_index "services", ["category_id"], name: "index_services_on_category_id", using: :btree
    #add_reference :services, :category, index: true
  end
end
