ActionController::Routing::Routes.draw do |map|

  #map.connect "", :controller => "contents", :action => "index"
  map.home "", :controller => "home", :action => "index"
  map.manager "/manager", :controller => "manage/manager", :action => "index"
  map.register "/register", :controller => "account", :action => "register"
  map.login "/login", :controller => "account", :action => "login"
  map.logout "/logout", :controller => "account", :action => "logout"
  map.account "/account", :controller => "account", :action => "index"
  map.page "/page/*name", :controller => "contents", :action => "view_page"
  map.connect 'date/:year/:month/:day', :controller => 'contents', :action => 'by_date',
              :month => nil, :day => nil,
              :requirements => {:year => /\d{4}/ }

  map.resources :categories
  map.resources :pages
  map.resources :contents, :has_many => [:comments, :categories]
  map.namespace :manage do |a|
    a.resources :contents, :has_many => [:comments, :categories]
    a.resources :comments, :member => { :reply => :get }
    a.resources :categories
    a.resources :pages
    a.resources :users
    a.resources :schedules
  end
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
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
