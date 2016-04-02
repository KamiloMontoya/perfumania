Rails.application.routes.draw do

  
  resources :tips
  root 'frontend/welcome#index'
  #devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => ''}
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  namespace :backend do
    resources :products
    resources :tests
    resources :answers
    resources :questions 
    resources :categories
    resources :notes
    resources :tips

    resources :questions do
      resources :answers
    end

    resources :tests do
      resources :questions
    end

    get '/test_preview/:id', to: 'tests#preview', as: 'test_preview'
    post '/preview_proccess', to: 'tests#preview_proccess'

    root 'welcome#index'
  end
  
  namespace :frontend do
    root 'welcome#index'
    get '/test_preview/:id', to: 'test#preview', as: 'test_preview'
    post '/preview_proccess', to: 'test#preview_proccess'

    get '/product_detail/:id', to: 'products#product_detail', as: 'product_detail'


    resources :products
    get '/products_all', to: 'products#show_all', as: 'products_all'

    get '/blog', to: 'blogs#index', as: 'blogs'
    get '/tips', to: 'tips#index', as: 'tips'
    get '/about', to: 'about#index', as: 'about'
    get '/contact', to: 'contact#index', as: 'contact'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You c an have the root of your site routed with "root"
  

  # Example of regular route:
     # get 'productos/:id' => 'productos#view'

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
