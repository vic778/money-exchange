require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "exchanges#new"
  resources :exchanges

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "exchange", to: "exchanges#exchange"
    end
  end

end
