require 'rails_helper'

RSpec.describe 'public_recipes#index', type: :feature do
  before(:each) do
    user = User.create!(name: 'William Raga', email: 'raga_0@gmail.com', password: '12345678')
    login_as(user, :scope => :user)
    @food_1 = Food.create(name: 'Nyama choma', measurement_unit: 'Kilogrammes', price: 800, quantity: 1)
    @food_2 = Food.create(name: 'Chips', measurement_unit: 'Pounds', price: 150, quantity: 0.5)
    @food_3 = Food.create(name: 'Banana bread', measurement_unit: 'Kilogrammes', price: 1000, quantity: 4)
    @recipe_1 = Recipe.create(name: 'Recipe 1', preparation_time: 60, cooking_time: 30, description: 'Lorem ipsum text', public: true)
    @recipe_2 = Recipe.create(name: 'Recipe 2', preparation_time: 30, cooking_time: 15, description: 'Lorem ipsum text', public: false)
    @recipe_3 = Recipe.create(name: 'Recipe 3', preparation_time: 120, cooking_time: 90, description: 'Lorem ipsum text', public: true)
    @recipe_1 = Recipe.create(name: 'Recipe 4', preparation_time: 60, cooking_time: 30, description: 'Lorem ipsum text', public: false)
    @foods = Food.all
    @public_recipes = Recipe.all.where(public: true)

    visit public_recipes_path
    # logout(:user)
  end

  it 'Displays the text \'Public recipes\'' do
    expect(page).to have_content('Public recipes')
  end

  it 'Displays all the foods prices' do
    @public_recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
    end
  end

  it 'Displays all the recipe owners name' do
    @public_recipes.each do |recipe|
      expect(page).to have_content(recipe.user.name)
    end
  end
  
  it 'Displays only two recipes with public set to true' do
    expect(@public_recipes.length).to eq 2
  end

  # it 'Redirects to recipe details page' do
  #   @public_recipes.each do |recipe|
  #     click_link recipe.name
  #     expect(current_path).to match recipe_path(recipe)
  #   end
  # end
end