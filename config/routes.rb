Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  #health check route for render deployment
  # get '/health_check', to: proc { [200, {}, ['success']] }

  #signup endpoint
  post'/signup', to: 'users#create'
  post'/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

  #product search endpoint
  post '/search', to: 'product_searches#create'
  

  #user search history endpoint
  get'/history', to: 'product_searches#history'

  # Defines the root path route ("/")
  # root "articles#index"
end
