DisMardisOrdering::Application.routes.draw do
  get  "usuarios/cambiar_password"
  post "usuarios/cambiar_password"
  
  resources :estado_pedidos

  resources :provincia

  resources :ciudads

  resources :familia

  resources :categoria

  resources :proveedors

  get  "usuarios/login"
  post "usuarios/login"
  
  get  "usuarios/logout"
  
  get  "usuarios/nuevo_gerente"
  post "usuarios/nuevo_gerente"
  get  "usuarios/nuevo_cajero"
  post "usuarios/nuevo_cajero"
  get  "usuarios/nuevo_cliente"
  post "usuarios/nuevo_cliente"

  resources :pedidos
  #get "pedidos/:id/responder_pedido"
  match 'pedidos/:id/responder_pedido', :to => 'pedidos#responder_pedido'
  #post "pedidos/responder_pedido"
  
  
  resources :session
  resources :productos

  resources :agencia

  resources :tipo_usuarios

  resources :usuarios

  get  "home/index"
  get  "home/forbidden"

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"
  #login 'usuario/login', :controller => "Usuarios", :action => "login"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
