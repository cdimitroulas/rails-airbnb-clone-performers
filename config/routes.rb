Rails.application.routes.draw do
  get 'new/create'

  get 'new/show'

  get 'new/delete'

  devise_for :users
  devise_for :performers
  root to: 'pages#home'

  # Performers resources
  resources :performers, only: [:index, :show, :edit, :update]
  # patch '/performers/:id/edit', to: 'performers#update'
  # put '/performers/:id/edit', to: 'performers#update'

  # Route for user dashboard
  resources :users, only: [:show]

  # Routes for bookings
  resources :bookings, only: [:new, :create, :show, :delete]

  # Route for performer dashboard
  get '/dashboard', to: 'performers#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
