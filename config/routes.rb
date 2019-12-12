Rails.application.routes.draw do
  resources :fragment_notes
  resources :fragments
  resources :images
  resources :galleries
  resources :character_notes
  resources :appearance_notes
  resources :appearances
  resources :scenes
  resources :characters
  resources :plot_notes
  resources :plots
  resources :stories
  resources :authors
  resources :login, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
