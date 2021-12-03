# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file = File.read(Rails.public_path.to_s + '/recipes.json')

recipes = JSON.parse(file)

recipes.each do |recipe|
  ingridents = recipe['ingridents']
  tags = recipe['tags']
  number_of_comments = recipe['nb_comments'].to_i
  recipe.delete('ingridents')
  recipe.delete('tags')
  recipe.delete('nb_comments')
  new_recipe = Recipe.create(recipe)
  ingridents.each do |ingrident|
    new_recipe.ingridents << Ingrident.create(name: ingrident)
  end

  tags.each do |tag|
    new_tag = Tag.create(name: tag)
    RecipeTag.create(recipe: new_recipe, tag: new_tag)
  end

  while number_of_comments.positive?
    new_recipe.comments << Comment.create(text: Faker::Quote.yoda)
    number_of_comments -= 1
  end
end
