Rails.application.routes.draw do
  root 'forms#new'

  resources :forms, only: [:create, :new]
end
