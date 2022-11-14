Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create]
      resources :users, only: %i[create show]
      get '/email-exists', to: 'users#email_exists'
      resources :products, only: %i[index show]
      resources :product_brands, only: %i[index show]
      resources :product_types, only: %i[index show]
      resources :baskets, except: %i[index]
    end
  end
end
