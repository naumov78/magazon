Rails.application.routes.draw do

  root "static_pages#root"
  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :destroy]
    resources :users, except: [:new] do
      resources :cart, only: [:index, :update, :destroy] do
        resources :cart_products, only: [:create, :destroy]
      end
    end


    resources :products, only: [:show]

    resources :categories, only: [:index, :show] do
      resources :products, only: [:show]
    end



  end
end
