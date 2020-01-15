Rails.application.routes.draw do
  root 'animes#index'
  get 'top/login'
  post 'top/login'
  get 'top/logout'
  get 'get_image/:id', to: 'users#get_image'
  resources :users, only: [:index, :new, :create, :destroy, :edit, :get_image]
  resources :animes, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :likes, only: [:create, :destroy]
  resources :bads, only: [:create, :destroy]

end
