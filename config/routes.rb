Rails.application.routes.draw do

  post 'approve', to: 'contracts#create'
  get 'contracts/create'
  get 'contracts/destroy'
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
resources :users, only: [:show, :new, :create, :edit, :update]
get 'wanttodolists', to: 'users#wanttodolists'
get 'mypage', to: 'users#mypage'
get 'myrecruit', to: 'users#myrecruit'
get 'mycontract', to: 'users#mycontracts'
get 'jobsasworkers', to: 'users#jobsasworkers'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
resources :jobs
resources :wants, only: [:create, :destroy]
resources :contracts, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
