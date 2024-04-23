Rails.application.routes.draw do
  match "/trans_actions", to: "trans_actions#method_not_allowed", via: [:put]
  resources :trans_actions,  only: [:index, :show, :create, :update, :destroy]
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get '/ping', to: 'ping#show', format: :json, as: :ping
end
