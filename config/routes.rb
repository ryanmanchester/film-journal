Rails.application.routes.draw do
  resources :directors
  #resources :movies
  get 'static/welcome'
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  resources :users do
    resources :movies
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#welcome'
end
