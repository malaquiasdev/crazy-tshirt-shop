Rails.application.routes.draw do
  resources :departments
  resources :products, only: [:index, :new, :edit, :create, :destroy, :update]
  get 'products/search' => 'products#search'
  root 'products#index'
end
