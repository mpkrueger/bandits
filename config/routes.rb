Rails.application.routes.draw do

  get 'goals/selection'

  resources :topics
  resources :comments
  resources :feedbacks
  resources :invites
  resources :custom_goals
  resources :retirements
  resources :emergency_funds
  resources :houses
  resources :trips do
    member do
      get 'summary'
      get 'savings_feedback'
    end
  end
  resources :colleges
  resources :to_dos
  resources :goals

  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#index'
end
