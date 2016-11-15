Rails.application.routes.draw do
  devise_for :performers
  devise_for :users
  root to: 'pages#home'

  # Search result page(index) and show page for the performers
  resources :performers, only: [:index, :show]

  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
