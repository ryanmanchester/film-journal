Rails.application.routes.draw do
  get 'static/welcome'
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  resources :users do
    resources :movies
  end
  root 'sessions#new'
  get 'popular_director', to: 'movies#popular_director'
  get '/directors', to: 'directors#index'
end
