Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  # 設定root
  root "tweets#index"

  #tweets routes
  resources :tweets, only: [:index, :create] do

    resources :replies, only: [:index, :create] do
      get :replies , :controller => 'replies', :action => 'index'
      post :replies, :controller => 'replies', :action => 'create'
    end

    member do       
      post :like
      post :unlike
    end

  end

  #users routes
  resources :users, only: [:edit, :update] do

    member do
      get :tweets
      get :likes
      get :followings
      get :followers
    end

  end


  #followship routes
  resources :followships, only: [:create, :destroy]

  #admin routes
  namespace :admin do
    root "tweets#index"
    get "/", :to => "tweets#index", :as => :admin_root_path
    resources :tweets, only: [:index, :destroy]     
    resources :users, only: [:index]
  end


  # 請依照專案指定規格來設定路由

end
