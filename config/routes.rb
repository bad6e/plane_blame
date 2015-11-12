Rails.application.routes.draw do
  root "dashboard#show"

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :delays, only: [:index]
    end
  end
end
