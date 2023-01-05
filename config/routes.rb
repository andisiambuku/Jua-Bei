Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #signup endpoint
  post'/signup', to: 'users#create'
  post'/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

  # Defines the root path route ("/")
  # root "articles#index"
end
