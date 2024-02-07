Rails.application.routes.draw do
  # resources :transactions
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/transactions", to:"trans_actions#index"
  get "/transactions/:id", to:"trans_actions#show"
  post "/transactions", to:"accounts#create"
  put "/transactions/:id", to:"trans_actions#update"
  delete "/transactions", to:"trans_actions#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
  get '/ping', to: 'ping#show', format: :json, as: :ping
end
