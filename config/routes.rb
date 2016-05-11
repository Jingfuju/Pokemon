Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  
  patch "capture", to: "pokemon#capture"
  patch "damage", to: "pokemon#damage", as: 'damage'
  get 'pokemon/new', to: 'pokemon#new'
  post 'pokemon/create', to: "pokemon#create"
end
