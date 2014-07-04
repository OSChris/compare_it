Rails.application.routes.draw do
  get 'home' => "home#home", as: 'home'
  get 'importer' => "eateries#importer", as: ''

  devise_for :users,
             :controllers => { registrations: "my_devise/registrations" }
  
  resources :profiles, only: [:show, :edit, :update]
  
  resources :eateries do 
    resources :reviews
    resources :galleries, only: [:index, :show]
    collection { post  :import }
  end

  resources :galleries, only: [] do 
    resources :pictures, except: [:edit, :update]
  end

  post 'eateries/:eatery_id/reviews/:id' => "reviews#like", as: 'eatery_review_like'
  post 'galleries/:gallery_id/pictures/:id' => "pictures#like", as: 'gallery_picture_like'
  post 'eateries/:id' => "eateries#like", as: "eatery_like"
  post 'profiles/:id' => "profiles#like", as: "profile_like"

  root 'home#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
