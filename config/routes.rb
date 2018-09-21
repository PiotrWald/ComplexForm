Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index]
  root 'users#new'
  delete 'users/delete_all', to: 'users#delete_all'
end
