Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "carts#show"

  resource :cart, only: [:show, :destroy] do
    resources :carts_products, only: [:update, :destroy]
  end
end
