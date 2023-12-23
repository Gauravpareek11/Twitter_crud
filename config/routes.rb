Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#index'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'my_post',to: 'users#my_post'

  resources :posts
end
