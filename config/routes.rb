Cet::Application.routes.draw do
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

  # Home
  root :to => 'home#show', :as => 'home'
  # Sessions
  match '/auth/:provider/callback' => 'sessions#create', :as => 'login_callback'
  match '/auth/failure', :to => 'sessions#failure'
  match '/login' => 'sessions#login', :as => 'login'
  match '/logout' => 'sessions#destroy', :as => 'logout'
  # Schools
  match '/:school' => 'schools#show', :as => 'school'
  match '/:school/projects' => 'schools#projects', :as => 'school_projects'
  # Users
  match '/profile/:uid' => 'users#show', :as => 'profile'
  match '/profile/:uid/edit' => 'users#edit', :as => 'edit_profile'
  # Projects
  match '/project/new' => 'projects#new', :as => 'new_project'
  match '/project/:pid/edit' => 'projects#edit', :as => 'edit_project'
  match '/project/:pid' => 'projects#show', :as => 'project'
  # Events
  match '/events/new' => 'events#new', :as => 'new_event'
  match '/events/all' => 'events#index', :as => 'events' 

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
