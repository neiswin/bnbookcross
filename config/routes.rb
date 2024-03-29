

require 'sidekiq/web'

Rails.application.routes.draw do

  authenticate :user, ->(user) { user.admin_role? } do
    mount Sidekiq::Web => '/sidekiq'
  end


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :users, only: %i[index show edit update]  do
    resources :books, only: %i[show]
    resources :interactions, only: %i[index new show edit update]
  end

  resources :places, only: %i[index show]
  
  resources :interactions, except: %i[index]

  resources :books do
    resources :interactions, only: %i[new edit]
  end


  namespace :admin do
    devise_for :users 
    resources :users, only: %i[index create edit update destroy]
  end
  # Defines the root path route ("/")

  root "pages#index"

 

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  mount ActionCable.server => '/cable'

end
