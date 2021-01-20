Rails.application.routes.draw do
  resoureces :airlines, only: [:show] do
    resources :flights, only: [:index]
  end
end
