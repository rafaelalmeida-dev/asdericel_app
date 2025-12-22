Rails.application.routes.draw do
<<<<<<< HEAD
  resources :responsaveis
  resources :estados_civis
  resources :funcoes
=======
<<<<<<< HEAD
  resources :noticias
=======
  resources :responsaveis
  resources :estados_civis
  resources :funcoes
>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
  resources :dirigentes
  resources :modalidades
  resources :atletas
  resources :calcas
  resources :camisas
  resources :associados
  resources :pessoas
  resources :ensinos
<<<<<<< HEAD
<<<<<<< HEAD
=======
  resources :estadocivils
<<<<<<< HEAD
  resources :categorias
=======
  resources :estadocivils
<<<<<<< HEAD
  resources :categorias
=======
>>>>>>> 9027e2b (refactor: remocao de model incorreta categoria e drop table de categoria.)
=======
>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
  resources :equipes
  resources :escolas
  resources :eventos
  resources :federacoes
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
  get "simbolo" => "externo#simbolo", as: :simbolo
  get "galeria" => "externo#galeria", as: :galeria
  get "diretoria" => "externo#diretoria", as: :diretoria
  get "doacoes" => "externo#doacoes", as: :doacoes

  # Rotas públicas de notícias
  get "noticias-publico" => "externo#noticias", as: :noticias_publico
  get "noticia/:id" => "externo#noticia", as: :noticia_publico
  # Defines the root path route ("/")

  root "home#index"  # Página pública

  get "dashboard", to: "pages#dashboard" # Página logada
end
