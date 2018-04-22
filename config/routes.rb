Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :new, :create, :destroy]
  get 'products/search' => 'products#search'
end
