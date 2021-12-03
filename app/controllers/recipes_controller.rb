class RecipesController < ApplicationController
  def index
    recipes = Recipe.includes(:ingridents, :tags, :comments)
                    .limit(10)
                    .offset(10 * recipe_params[:offset].to_i)
    render json: recipes, meta:  {total_count: Recipe.count} , adapter: :json
  end

  def show
    recipe = Recipe.includes(:ingridents, :tags,
                             :comments).find(params[:id]).to_json(include: %i[ingridents tags comments])
    render json: recipe
  end

  def search
    render json: Recipe.where('name like ?', "%#{recipe_params[:key]}%").to_json
  end

  private

  def recipe_params
    params.permit(:key, :offset)
  end
end
