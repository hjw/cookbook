class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show,
                                     :edit,
                                     :update,
                                     :destroy]

  def index
    @recipes = Recipe.all
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
    # before_action @recipe = Recipe.find(params[:id])
  end

  def edit
    # before_action @recipe = Recipe.find(params[:id])
  end

  def update
    # before_action @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe has been updated."
      redirect_to @recipe
    else
      flash[:alert] = "Recipe has not been updated."
      render "edit"
    end
  end

  def destroy
    # before_action @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Recipe has been deleted."
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :ingredients)
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert]= "The recipe you were looking for could not be found."
      redirect_to recipes_path
    end
end
