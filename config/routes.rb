Rails.application.routes.draw do
  get 'performers/index'

  get 'performers/show'

  devise_for :performers
  devise_for :users
  root to: 'pages#home'

  resources :performers, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
