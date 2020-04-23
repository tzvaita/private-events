Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  get 'events/show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  root 'application#hello'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
