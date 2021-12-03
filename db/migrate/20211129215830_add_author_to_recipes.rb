class AddAuthorToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :author, :string
  end
end
