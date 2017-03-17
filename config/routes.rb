Rails.application.routes.draw do
  get 'checkout/personInfo'

  get 'checkout/shipping'

  get 'checkout/check'

  get 'checkout/confirm'

  match 'catalog/latest', :to => 'catalog#latest', via: [:get, :post]
  # I've created a gif controller so I have a page I can secure later.
  # This is optional (as is the root to: above).
  get '/cool' => 'gif#cool'
  get '/sweet' => 'gif#sweet'

  # these routes are for showing users a login form, logging them in, and logging them out.
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy'

   get '/signup' => 'users#new'
   post '/users' => 'users#create'


  get 'catalog/index'

  get 'catalog/show'

  get 'catalog/search'

  get 'catalog/latest'

  resources :publishers
  namespace :admin do
    resources :author
    resources :publishers
  end
  namespace :admin do
  resources :books
  get 'author/new'
  end

  namespace :admin do
  get 'author/create'
  end

  namespace :admin do
  get 'author/edit'
  end

  namespace :admin do
  get 'author/update'
  end

  namespace :admin do
  get 'author/destroy'
  end

  namespace :admin do
  get 'author/show'
  end

  namespace :admin do
  get 'author/index'
  end

  get 'about/index'

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
  scope :module => "admin" do
    resources :books
  end
  root :to => 'catalog#index'
  match ':controller(/:action(/:id(.:format)))', via: [:get, :post]

end
