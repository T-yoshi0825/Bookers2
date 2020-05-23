Rails.application.routes.draw do
  devise_for :users

  root to:'books#top'
  get '/home/about', to: 'books#about'
  resources :users, only: [:new, :index, :show, :edit, :update]
  # resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :books, execpt: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
