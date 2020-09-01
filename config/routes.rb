Rails.application.routes.draw do
  get 'sessions/new'
  root 'blogs#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only:[:new,:show,:create,:edit,:destroy]
  resources :favorites, only: [:create, :show,:destroy]
end
