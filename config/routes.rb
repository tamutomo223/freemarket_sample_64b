Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  
  resources :items , only:[:sell,:exhibit] do
    collection do
      get 'sell'
      post 'exhibit'
    end
  end

  get "/signup" , to: "users#signup", as: "signup"

  resources :items ,only:[:show,:sell,:exhibit]

end
