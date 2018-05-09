Rails.application.routes.draw do
  root 'pages#home'
  get '/vouchers', to: 'pages#vouchers'

  resources :merchants
  devise_for :users
  # root "deals#index"
  
  resources :deals do 
    member do 
      post 'apply'
    end
  end



  # get "/vouchers/:id", to: "vouchers#show", as: 'voucher'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
