Rails.application.routes.draw do

  resources :items
  resources :orders do
    resources :order_items
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
