Rails.application.routes.draw do
  resources :account_transactions
  # resources :transactions
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/transactions", to:"trans_actions#create"
  get "/transactions", to:"trans_actions#show"
  get "/transactions", to:"trans_actions#index"
  delete "/transactions", to:"trans_actions#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
  get '/ping', to: 'ping#show', format: :json, as: :ping
end
