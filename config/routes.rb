Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'                        #ルートパスの指定
  resources :blogs 
  resources :users, only: [:show]       #users_controllerに対してのresourcesメソッド
end
