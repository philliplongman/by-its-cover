Rails.application.routes.draw do

  root 'homes#index'

  devise_for :users

  resources :users, only: [:show] do
    resource :profile, except: [:index, :destroy]
    resources :collections, only: [:show, :new, :create]
  end

end
