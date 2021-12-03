class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :difficulty, :image_url, :cook_time, :prep_time, :total_time, :people_quantity,
             :budget, :author_tip, :rate
  has_many :comments
  has_many :tags
  has_many :ingridents

  def total_count
    Recipe.count
  end
end
