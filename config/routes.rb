Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index show]
      resources :product_brands, only: %i[index show]
      resources :product_types, only: %i[index show]
      resources :baskets, except: %i[index]
    end
  end
end
