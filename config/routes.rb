ActionController::Routing::Routes.draw do |map|

  map.registration_fill_in 'registration/fill_in', :controller => 'Registration', :action=> 'fill_in'
  map.registration_signin 'registration/signin', :controller => 'Registration', :action => 'signin'
  map.register_stampeder 'registration/register', :controller => 'Registration', :action => 'register_stampeder'
  map.registration_view_all 'registration/view_all', :controller => 'Registration', :action => 'view_all' 
  map.registration 'registration', :controller => 'Registration', :action => 'index'
  map.add_barcode 'registration/addbarcode', :controller => 'Registration', :action => 'add_barcode'
  map.autocomplete 'autocomplete.js', :controller => 'Stampeders', :action => 'autocomplete'
  map.create_signin 'registration/signin/create/:id', :controller => 'Signins', :action => 'create'
  map.confirm_signin 'registration/signin/confirm', :controller => 'Signins', :action => 'confirm'
  map.sign_up 'sign_up', :controller => 'Public', :action => 'sign_up'
  map.resources :stampeders
  map.resources :teams
  map.resources :points
  map.resources :schools
  map.resources :churches

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "public"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
