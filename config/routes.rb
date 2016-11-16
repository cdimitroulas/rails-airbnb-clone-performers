Rails.application.routes.draw do
  devise_for :performers
  devise_for :users
  root to: 'pages#home'

  # Performers resources
  resources :performers, only: [:index, :show, :edit, :update]
  # patch '/performers/:id/edit', to: 'performers#update'
  # put '/performers/:id/edit', to: 'performers#update'

  # Route for user dashboard
  resources :users, only: [:show]

  # Route for performer dashboard
  get '/dashboard', to: 'performers#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
