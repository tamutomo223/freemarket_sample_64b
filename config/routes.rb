Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: "items#index"
  

  resources :cards, only: [:new, :index, :create, :destroy]
  #itemsコントローラ内に作ったオリジナルの変数にルーティングの設定をしたい場合,次の①,②に記述してください
  resources :items , only:[:sell,:exhibit,:show] do#①only内にオリジナルの変数名を記述
    collection do
      #②collection内にhttpメソッド 'オリジナルの変数名'と記述
      get 'sell'
      post 'exhibit'
    end
    member do
      #②URIPatternにidが欲しい場合はcollectionではなくmember内に記述
    end
  end
  

  resources :users do
    collection do
      get 'mypage'
      get 'logout'
      get "signup"
      get "address"
      post "address_create"
      get "mypage/profile" ,to: "users#profile"
      get "mypage/card" ,to: "users#card"
    end
  end
end
