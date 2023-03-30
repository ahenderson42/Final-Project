Rails.application.routes.draw do
  get 'pages/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'products/index'
  get 'products/show'
  get 'products/search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "products#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
