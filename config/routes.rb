Rails.application.routes.draw do

  resources :items, only: [:create, :index, :show, :destroy]
  resources :order, only: [:create, :index, :show, :destroy] do
    resources :order_item, only: [:create, :update, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
