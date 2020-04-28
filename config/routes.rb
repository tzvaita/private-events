Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  root 'users#new'
  get '/event_attendance', to: 'attendances#new'
  post '/event_attendance', to: 'attendances#create'
  resources :users
  resources :events
  resources :attendances
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
