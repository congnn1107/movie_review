Rails.application.routes.draw do

  post '/register', to: 'users#create'
  resource :users , only:[:update, :destroy, :show]
  resources :movies
  devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
