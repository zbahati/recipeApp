Rails.application.routes.draw do
  resources :general_shopping_lists
  devise_scope :user do
    delete '/logout', to: 'devise/sessions#destroy', as: :logout
  end
  
  devise_for :users
  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :users
  resources :general_shopping_list, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'recipes#index'
end
