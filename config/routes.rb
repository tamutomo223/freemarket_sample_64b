Rails.application.routes.draw do
  devise_for :users
  # devise_scope :user do
  #   get "signup/registration", to: "devise/registrations#new"
  # end
  root to: "items#index"
  get "/sell" , to: "items#sell", as: "sell_items"
  resources :users do 
    collection do
      get "signup"
    end
  end
  
end
