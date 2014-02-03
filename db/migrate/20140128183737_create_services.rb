class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :category_id, null: false
      t.string :text, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
