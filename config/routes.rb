Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'users', to: 'users#create'
      get 'users/current-user', to: 'users#current_user'
      get 'users/email-exists', to: 'users#email_exists'
      
      put '/addresses', to: 'addresses#update'
      get '/addresses', to: 'addresses#show'
      
      post 'payments/:basket_id', to: 'payments#create'
      
      resources :webhooks, only: %i[create]
      
      resources :delivery_methods, only: %i[index]

      resources :orders, only: %i[index show create]

      resources :sessions, only: %i[create]
      resources :products, only: %i[index show]
      resources :product_brands, only: %i[index show]
      resources :product_types, only: %i[index show]
      resources :baskets, except: %i[index]
    end
  end
end
