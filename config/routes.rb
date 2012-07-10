Nopassword::Application.routes.draw do
  get "main/index"
  root :to => 'main#index'
  match 'send_login_email' => 'main#send_login_email'
  match 'login/:id' => 'main#login'
  match 'logout' => 'main#logout'
  match 'revoke/:id' => 'main#revoke'
end
