Rails.application.routes.draw do
  devise_for :users
  devise_for :performers
  root to: 'pages#home'

  # Performers resources
  resources :performers, only: [:index, :show, :edit, :update]
  # patch '/performers/:id/edit', to: 'performers#update'
  # put '/performers/:id/edit', to: 'performers#update'

  # Route for user dashboard
  resources :users, only: [:show, :edit, :update]

  # Route for performer dashboard
  get '/dashboard', to: 'performers#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
