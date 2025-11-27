Rails.application.routes.draw do
  resources :authorizations, only: [ :create ]
  resources :movements, only: [ :create, :index ]
  resources :people, only: [ :create, :index, :show, :update, :destroy ]
end
