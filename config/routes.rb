Bongo::Engine.routes.draw do
  root to: "articles#index"
  resources :articles
  resources :drafts
  resources :files, only: :create
end
