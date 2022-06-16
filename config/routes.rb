Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  root to: "pages#home"
  resources :parties do
    get "ingredients", to: "parties#ingredients"
    # get "loading", to: "parties#loading"
    get 'invite', to: "parties#invite"
    get :qr_code_generator
    get :qr_code_download
  end

  resources :conversations, only: [:index]

  get 'my_recipes', to: 'recipes#my_recipes'
  get 'loading', to: 'pages#loading'

  resources :recipes, only: [:index, :show]

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
