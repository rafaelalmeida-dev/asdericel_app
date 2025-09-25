Rails.application.routes.draw do
  resources :atletas
  resources :calcas
  resources :camisas
  resources :associados
  resources :pessoas
  resources :funcaos
  resources :ensinos
  resources :estadocivils
  resources :categoria
  resources :equipes
  resources :escolas
  resources :eventos
  resources :federacaos
  resources :responsavels
  resources :parentescos
  resources :sexos
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :users, only: %i[index show edit ]
  get "pages/dashboard"

  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"
end
