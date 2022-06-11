Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :parties do
    get "ingredients", to: "parties#ingredients"
    get :qr_code_generator
    get :qr_code_download
  end


  get 'my_recipes', to: 'recipes#my_recipes'

  resources :recipes, only: [:index, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
