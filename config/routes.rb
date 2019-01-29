Rails.application.routes.draw do
  resources :users
  get 'static/welcome'
  get 'signup', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#welcome'
end
