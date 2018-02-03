Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users


  # 設定root
  root "tweets#index"

  #tweet routes
  resources :tweets, only: [:index, :create] 



  # 請依照專案指定規格來設定路由

end