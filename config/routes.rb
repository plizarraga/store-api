Rails.application.routes.draw do
  # root "articles#index"
  resources :products, only: [:index, :show]
  resources :product_brands, only: [:index, :show]
  resources :product_types, only: [:index, :show]
end
