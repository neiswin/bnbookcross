Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: %i[index show]  do
    resources :books, only: %i[show]
  end


  resources :books
  # Defines the root path route ("/")
  root "pages#index"
end
