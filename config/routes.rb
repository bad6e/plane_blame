Rails.application.routes.draw do
  root "dashboard#show"

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :delays, only: [:index]
      get "/autocomplete", to: 'delays#autocomplete'
    end
  end

  resources :dashboard do
    get :autocomplete_airport_name, :on => :collection
  end
end
