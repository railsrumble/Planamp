Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  resources :user_goals, only: [:index]

  resources :goals, only: [:show, :create, :new] do
    member do
      get :random_motivation
      put :disable
    end
  end

  put 'user_goals/:id/share' => 'user_goals#share', as: :share_goal
  put 'goals_in_list/:id/add_to_list' => 'goals_in_list#add_goal_to_list', as: :add_to_goal_list
  put 'goals_in_list/:id/done' => 'goals_in_list#done', as: :done_goal
  put 'goals_in_list/:id/fail' => 'goals_in_list#fail', as: :fail_goal

  get 'about' => "main#about"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'categories#index'
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
