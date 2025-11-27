Rails.application.routes.draw do
  resources :authorizations, only: [ :create ]
  resources :movements, only: [ :create, :index ]
end
