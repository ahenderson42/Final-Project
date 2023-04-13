Rails.application.routes.draw do

  devise_for :shoppers
  get 'categories/index'
  get 'categories/show'
  resources :categories, only: %i[index show]
  resources :cart, only: %i[create destroy]
  get 'pages/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'products/index'
  # get 'products/show'
  get 'products/search'
  resources :products, only: %i[index show search]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "products#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
