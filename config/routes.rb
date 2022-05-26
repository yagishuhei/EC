Rails.application.routes.draw do

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
