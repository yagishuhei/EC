Rails.application.routes.draw do


  #会員用
  #URL/customer/sign_in ...
  #skipで余分なルーティングを削除＋app/views/public/shared/_links.html.erbの余分な記述を削除
  devise_for :customers, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用
  #URL/customers/sign_in ...
  #skipで余分なルーティングを削除＋app/views/admin/shared/_links.html.erbの余分な記述を削除
  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }

  #会員用
  #URLはそのまま、ファイル構成だけ指定のパス
  scope module: :public do

    get root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: 'about'

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    resources :customers, only: [:show, :edit, :update]
    #会員の退会確認画面
    get 'customers/unsubscribe', to: 'customers#unsubscribe'
    #会員の退会処理
    patch 'customers/withdraw', to: 'customers#withdrow'
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :create, :index, :show]
    #注文情報確認画面
    post 'orders/comfirm', to: 'orders#comfirm'
    #注文完了画面
    get 'orders/complete', to: 'orders#complete'

  end

  #管理者用
  #URLはadminをつけて、ファイル構成も指定
  namespace :admin do

    get root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
