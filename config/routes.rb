Rails.application.routes.draw do
  devise_for :users,
  controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations' ,
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: "items#index"
  
  resources :cards, only: [:new, :index, :destroy,:create,:add] do
    collection do
      get "add"
    end  

  end  
  #itemsコントローラ内に作ったオリジナルの変数にルーティングの設定をしたい場合,次の①,②に記述してください
  resources :items , only:[:sell,:exhibit,:show, :edit, :create] do#①only内にオリジナルの変数名を記述
    collection do
      #②collection内にhttpメソッド 'オリジナルの変数名'と記述
      get 'sell'
      post 'exhibit'
    end
    member do
      #②URIPatternにidが欲しい場合はcollectionではなくmember内に記述
      get "buy"
      post "buy_create"
      get "sell/edit", to: "items#edit_input"
    end
  end
  

  resources :users ,only:[:mypage,:logout,:signup,:address,:address_create] do
    collection do
      get 'mypage'
      get "mypage/listing", to: "users#listing"
      get 'logout'
      get "signup"
      get "address"
      post "address_create"
      get "mypage/profile" ,to: "users#profile"
      get "mypage/card" ,to: "users#card"
      get "finish"
    end
  end

end
