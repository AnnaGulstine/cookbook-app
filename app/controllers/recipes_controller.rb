class RecipesController < ApplicationController
  def index
    if current_user
      @recipes = current_user.recipes
    else
      redirect_to "/users/sign_in"
    end
    sort_by = params[:sort_by]
    sort_order = params[:sort_order]
    vegetarian = params[:vegetarian]
    if sort_by 
      @recipes = Recipe.order(sort_by => sort_order)
    elsif vegetarian 
      @recipes = Recipe.where("user_id = ? AND ingredients NOT LIKE ?", "#{current_user.id}", "%chicken%")
    end
  end

  def show
    if params[:id] == 'random'
      # recipes = Recipe.all
      # @recipe = recipes.sample
      Recipe.order('RANDOM()').first
    else
      @recipe_id = params[:id]      
      @recipe = Recipe.find_by(id: @recipe_id)
    end
  end

  def new
  end

  def create
    Recipe.create(
      title: params[:title].capitalize,
      chef: params[:chef].capitalize,
      ingredients: params[:ingredients].capitalize,
      directions: params[:directions].capitalize,
      user_id: current_user.id
      )
    redirect_to '/recipes'
  end
end