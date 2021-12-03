class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :rate
      t.string :budget
      t.string :author_tip
      t.string :difficulty
      t.integer :people_quantity
      t.string :cook_time
      t.string :prep_time
      t.string :total_time
      t.timestamps
    end
  end
end
