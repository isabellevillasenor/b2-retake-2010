Rails.application.routes.draw do
  resources :airlines, only: [:show]

  resources :flights, only: [:index] do
    resources :passengers, only: [:destroy]
  end
end
