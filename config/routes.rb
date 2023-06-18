Rails.application.routes.draw do

  resources :students
  resources :tracks
  
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  get 'registration/new'
  get 'registration/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'register', to: 'registration#new'
  post 'register', to: 'registration#create'

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
end
