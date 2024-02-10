Rails.application.routes.draw do
  match "/transactions", to: "trans_actions#method_not_allowed", via: [:put]
  resources :trans_actions,  only: [:index, :show, :create],constraints: { method: ['GET', 'POST'] }
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/transactions", to:"trans_actions#index"
  get "/transactions/:id", to:"trans_actions#show"
  post "/transactions", to:"accounts#create"
  put "/transactions/:id", to:"trans_actions#update", via: [:patch]
  delete "/transactions", to:"trans_actions#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
  get '/ping', to: 'ping#show', format: :json, as: :ping
end
