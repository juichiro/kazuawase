Rails.application.routes.draw do

  get 'jobs/index'
  get 'jobs/show'
  get 'jobs/new'
  get 'jobs/create'
  get 'jobs/update'
  get 'jobs/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
root to: 'toppages#index'
resources :users, only: [:show, :new, :create]
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
