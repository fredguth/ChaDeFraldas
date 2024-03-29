ChaDeFraldas::Application.routes.draw do
 

  match 'payment_notifications/confirmation' => 'payment_notifications#confirmation', via: [:get,:post]
  match 'payment_notifications' => 'payment_notifications#create', via: [:get,:post]

  
  resources :selections

  resources :products

  resources :contributions

  resources :events 
  resources :event_steps

  match "about", to: 'info#about', via: [:get, :post]
  match "terms", to: 'info#terms', via: [:get, :post]
  match "privacy", to: 'info#privacy', via: [:get, :post]
  match "contact", to: 'info#contact', via: [:get, :post]
  match "unauthorized", to: 'info#unauthorized', via: [:get, :post]

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks", sessions: "sessions"}
  resources :users

  
   match 'events/:id', to: 'events#show', via: [:get, :post]
   match 'products/:id/edit', to: 'products#edit', via: [:get, :post]
  # resources :tags, only: :index
  
  # resources :blogs do
  #   resources :authors
  # end

  match '/' => 'home#index', via: [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
