Rails.application.routes.draw do
  root 'forms#new'
  resources :forms, only: [:create, :new]
  get '/.well-known/acme-challenge/:id' => 'application#letsencrypt'
end
