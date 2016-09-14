Rails.application.routes.draw do

  get 'custom_goals/new'

  get 'custom_goals/show'

  get 'custom_goals/edit'

  get 'retirements/new'

  get 'retirements/show'

  get 'retirements/edit'

  get 'emergency_funds/new'

  get 'emergency_funds/show'

  get 'emergency_funds/edit'

  get 'houses/new'

  get 'houses/show'

  get 'houses/edit'

  get 'trips/new'

  get 'trips/show'

  get 'trips/edit'

  get 'colleges/new'

  get 'colleges/show'

  get 'colleges/edit'

  get 'to_dos/index'

  get 'to_dos/new'

  get 'to_dos/show'

  get 'to_dos/edit'

  get 'goals/index'

  get 'goals/new'

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
