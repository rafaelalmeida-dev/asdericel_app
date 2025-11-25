Rails.application.routes.draw do
  resources :dirigentes
  resources :modalidades
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
  resources :federacoes
  resources :responsavels
  resources :parentescos
  resources :sexos
  resources :roles
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :users, only: %i[index edit update destroy]
  

  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "club-history" => "externo#club_history", as: :club_history
  # Defines the root path route ("/")
 
  root "home#index"  # Página pública

  get "dashboard", to: "pages#dashboard" # Página logada

end
