Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"

  concern :common do
    post "/register", to: "users#create"
    # post "/login", to: "sessions#create"
  end

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }

      #login users
      namespace :users do
        concerns :common
        resource :users, only: [:update, :destroy, :show]
        resources :posts
        resources :movies, only: [:index]
      end

      #admin users
      namespace :admin do
        resources :movies
        resources :posts do
          member do
            post :publish
          end
        end
      end

      #public users
      namespace :public do
        resources :movies
        resources :posts, param: :slug
        get "/search", to: "search#index"
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
