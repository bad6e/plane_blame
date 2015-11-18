Rails.application.routes.draw do
  root "dashboard#show"

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get "/search", to: 'auto_complete#search'
      get "/total/:id", to: 'dashboard#total'
      get "/all", to: 'dashboard#total_flights'
    end
  end
end
