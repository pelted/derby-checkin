require "oath/constraints/signed_in"
require "oath/constraints/signed_out"

Rails.application.routes.draw do
  root 'home#index'
  resource :session, only: [:new, :create, :destroy]
  
  constraints Oath::Constraints::SignedIn.new do
    resources :users, only: [:new, :create]
    resources :races do
      resources :entries
    end
  end
  
  resources :races, only: [:show] do
    resources :registrations, only: [:new, :create]
  end
end
