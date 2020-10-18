Rails.application.routes.draw do
  get 'search/search'
  devise_for :users

  root to:'books#top'
  get '/home/about', to: 'books#about'
  get '/search' => 'search#search'
  
  resources :users, only: [:new, :index, :show, :edit, :update]
  # resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :books, execpt: [:new] do 
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
