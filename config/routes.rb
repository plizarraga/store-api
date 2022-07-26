Rails.application.routes.draw do
  # root "articles#index"
  resources :products, only: %i[index show]
  resources :product_brands, only: %i[index show]
  resources :product_types, only: %i[index show]
end
