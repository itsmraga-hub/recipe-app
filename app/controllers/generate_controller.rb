class GenerateController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end