Rails.application.routes.draw do
  devise_for :performers
  devise_for :users
  root to: 'pages#home'

  # Performers resources (edit and update for editing the profile)
  resources :performers, only: [:index, :show, :edit, :update]

  # Route for user dashboard
  resources :users, only: [:show]

  # Route for performer dashboard
  get '/dashboard', to: 'performers#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
