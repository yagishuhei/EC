Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  get 'admin/genres'
  get 'admin/index'
  get 'admin/edit'
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  get 'addresses/index'
  get 'addresses/edit'
  namespace :public do
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  #顧客用
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


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
