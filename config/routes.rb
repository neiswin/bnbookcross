Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :users, only: %i[index show edit update]  do
    resources :books, only: %i[show]
  end

  resources :places, only: %i[index show]


  resources :books


  namespace :admin do
    devise_for :users 
    resources :users, only: %i[index create edit update destroy]
  end
  # Defines the root path route ("/")
  root "pages#index"

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

end
