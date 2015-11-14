Rails.application.routes.draw do
  root "dashboard#show"

  namespace :api do
    namespace :v1, defaults: {format: :json} do

      resources :delays, only: [:index]

      get "/search", to: 'auto_complete#search'

      get "/airportname/:id", to: 'dashboard#airport_name'
      get "/totaldepartures/:id", to: 'dashboard#total_departures'
      get "/ontimedepartures/:id", to: 'dashboard#on_time_departures'
      get "/latedepartures/:id", to: 'dashboard#late_departures'

    end
  end
end
