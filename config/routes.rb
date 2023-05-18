Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[create]

  get 'ranking/actual', to: 'rankings#actual'
  get 'ranking/by_month', to: 'rankings#by_month'
  post 'ranking/record', to: 'rankings#record'

  post 'auth/login', to: 'authentication#login'
end
