Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :items
  resources :orders do
    resources :order_items
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
