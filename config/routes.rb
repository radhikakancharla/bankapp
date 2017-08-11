Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'accounts#index'
  resources :accounts, only:[:index] do
    member do
      get '/bankapp', to:'accounts#bankapp'
      post '/deposit', to: 'accounts#deposit'
      post '/withdraw', to: 'accounts#withdraw'
      post '/clearsuspension', to: 'accounts#clear_suspension'
    end
  end
end
