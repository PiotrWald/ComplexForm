Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy, :index]
  root 'users#new'
end
