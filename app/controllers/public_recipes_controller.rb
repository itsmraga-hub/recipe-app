class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: :desc)
    @public_recipes = @recipes.select(&:public)
  end
end
