Rails.application.routes.draw do

  get 'pages/index'

  resources :books


  # Defines the root path route ("/")
  root "pages#index"
end
