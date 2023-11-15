Rails.application.routes.draw do
  devise_scope :user do
    delete '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  get "public_recipes", to: "recipes#public_recipes", as: :public_recipes
  devise_for :users
  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'foods#index'
end
