class AddRecipeToIngridents < ActiveRecord::Migration[6.1]
  def change
    add_reference :ingridents, :recipe, foreign_key: true
  end
end
