Rails.application.routes.draw do


  devise_for :users
  root to: 'home#top'
  get "home/about" => "home#about", as: "about"
  resources :books, only: [:new, :create, :index, :show, :destroy, :update, :edit]
  resources :users, only: [:show, :edit, :create, :index, :update, :destroy] # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
