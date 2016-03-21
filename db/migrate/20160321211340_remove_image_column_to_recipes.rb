class RemoveImageColumnToRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :src, :string
  end
end
