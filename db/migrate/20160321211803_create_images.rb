class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :src
      t.integer :recipe_id
      t.boolean :front_page?

      t.timestamps null: false
    end
  end
end
