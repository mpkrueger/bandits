Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/new'

  get 'comments/show'

  get 'comments/edit'

  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#index'
end
