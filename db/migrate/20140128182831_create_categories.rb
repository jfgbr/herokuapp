class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :text, null: false

      t.timestamps
    end
  end
end
