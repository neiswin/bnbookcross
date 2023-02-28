Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'pages/index'

  resources :books


  # Defines the root path route ("/")
  root "pages#index"
end
