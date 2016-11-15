Rails.application.routes.draw do
  devise_for :performers
  devise_for :users
  root to: 'pages#home'

  # Search result page(index) and show page for the performers
  resources :performers, only: [:index, :show, :edit]

  # Route for user dashboard
  resources :users, only: [:show]

  # Route for performer dashboard
  get '/dashboard', to: 'performers#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
