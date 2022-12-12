Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users
  resources :foods
  resources :recipes
  # get 'public_recipes#index', as: 'public_recipes'
  # get 'general_shopping_list', as: 'general_shopping_list'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root ""
end
