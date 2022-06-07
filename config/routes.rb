Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :parties

  resources :recipes, only: [:index, :show]
  resources :party_dates, only: [:index, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
