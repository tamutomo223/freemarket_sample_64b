Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  
  #itemsコントローラ内に作ったオリジナルの変数にルーティングの設定をしたい場合,次の①,②,③に記述してください
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

  get "/signup" , to: "users#signup", as: "signup"

  resources :users ,only:[:mypage] do
    collection do
      get 'mypage'
    end
  end

end
