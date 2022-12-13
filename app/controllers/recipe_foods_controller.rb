class RecipeFoodsController < ApplicationController
  def new
    recipe = Recipe.find(params[:recipe_id])
    unless recipe.user == current_user
      flash[:alert] = 'Access Denied.'
      return redirect_to recipes_path
    end
    @recipe_food = RecipeFood.new
    @foods = current_user.foods
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    recipe_food = RecipeFood.new(recipe_food_params)
    recipe_food.recipe = @recipe
    redirect_to recipe_path(@recipe), notice: 'Ingredient added.' if recipe_food.save
  end

  def destroy
    recipe_food = RecipeFood.find(params[:id])
    unless recipe_food.recipe.user == current_user
      flash[:alert] = 'Access Denied.'
      return redirect_to recipes_path
    end
    flash[:notice] = 'Ingredient removed.' if recipe_food.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
