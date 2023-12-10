Rails.application.routes.draw do
  # setting up route for localhost:3000 home page
  root 'articles#index'
  # setting up route fot localhost:3000/articles
  # get "/articles", to: 'articles#index'
  # get "/articles/:id", to: 'articles#show'

  resources :articles
  


  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
