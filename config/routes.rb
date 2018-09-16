Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  devise_scope :user do
    root to: "users/registrations#new"
  end
end
