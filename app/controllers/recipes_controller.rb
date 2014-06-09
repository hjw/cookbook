class RecipesController < ApplicationController
  def index
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:notice] = "Recipe has been created."
      redirect_to @recipe
    else
      flash[:alert] = "Recipe has not been created."
      render "new"
    end

  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :ingredients)
    end
end
