Rails.application.routes.draw do
  concern :common do
    post "/register", to: "users#create"
    # post "/login", to: "sessions#create"
  end

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }
      namespace :users do
        concerns :common
        resource :users, only: [:update, :destroy, :show]
      end
      namespace :admin do
        resources :movies
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
