Rails.application.routes.draw do

  get 'invites/new'

  get 'families/invite'

  resources :topics
  resources :comments
  resources :invites

  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#index'
end
