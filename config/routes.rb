Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get "/sell" , to: "items#sell", as: "sell_items"
  get "/signup" , to: "users#signup", as: "signup"
  resources :items ,only:[:show]
end
