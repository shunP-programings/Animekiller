Rails.application.routes.draw do
  root 'animes#index'
  get 'top/login'
  post 'top/login'
  get 'top/logout'
  resources :users, only: [:index, :new, :create, :destroy]
  resources :s, only: [:index, :new, :create, :destroy]
  resources :likes, only: [:create, :destroy]

end
