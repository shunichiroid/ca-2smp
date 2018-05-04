Rails.application.routes.draw do
  resources :merchants
  devise_for :users
  root "deals#index"
  
  resources :deals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
