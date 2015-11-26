Rails.application.routes.draw do
  root "dashboard#show"

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :airports, only: [:show]
      resources :departures, only: [:index]
      get "/search", to: 'auto_complete#search'
    end
  end
end
