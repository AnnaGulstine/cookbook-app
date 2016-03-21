class AddImageColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :src, :string
  end
end
