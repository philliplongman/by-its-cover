Rails.application.routes.draw do

  root 'homes#index'

  devise_for :users

  resources :users, only: [:show] do
    resource :profile, only: [:show, :new, :create]
  end

end
