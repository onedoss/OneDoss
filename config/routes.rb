ResumeViewer::Application.routes.draw do


  get "sessions/new"

  get "home/index_temp"


  resources :users do
     resources :resumes do
        resources :sections do
          resources :items
        end
     end
  end

  resources :recruiters
  
  resources :companies do
    resources :positions
  end


  resources :sessions
  
  resources :employments
  resources :applications

  root :to => 'home#index_temp'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "recruiter_log_in" => "sessions#new_recruiter", :as => "recruiter_log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "recruiter_sign_up" => "recruiters#new", :as => "recruiter_sign_up"

  get "test_site" => 'home#index', :as => "test_site"
  
  match 'uploads' => 'resumes#upload', :as => 'resume_upload'

  match "/recruiters/approve/:employment_id" => "recruiters#approve", :as =>"recruiter_approve_employment", :via => :put


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




  # See how all your routes lay out with "rake routes"


  # This is a legacy wild controller route that's not recommended for RESTful applications.

  # Note: This route will make all actions in every controller accessible via GET requests.

  # match ':controller(/:action(/:id(.:format)))'
end
