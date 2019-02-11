Rails.application.routes.draw do

  get 'wants/create'
  get 'wants/destory'
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
resources :users, only: [:show, :new, :create] do
   member do 
     get :wanttodolists
   end 
 end
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
resources :jobs
resources :wants, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
