Loanstar::Application.routes.draw do

  scope "/api" do
    post "/user/create" => "user#create"
    get "/user/login" => "user#login"

    get "/item" => "item#show"
    get "/items" => "item#index"
    post "/item/create" => "item#create"
    put "/item/update" => "item#update"
    delete "/item/delete" => "item#delete"
    get "/items/owned" => "item#index_by_user"

    get "/borrow" => "item#borrow"
    post "/borrow/create" => "borrow#create"
    put "/borrow/update" => "borrow#update"
    get "/borrows" => "item#borrows_by_user"
    get "/borrows/requests" => "item#requests_by_user"
  end

  get "/picture/:id" => "picture#show"

  get "api/ping"
  delete "api/reset"
  post "api/reload"

  match "*all" => "application#cors", :constraints => {:method => "OPTIONS"}

  root :to => "api#ping"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
