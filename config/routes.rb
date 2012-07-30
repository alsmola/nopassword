Nopassword::Application.routes.draw do
  get "main/index"
  root :to => 'main#index'
  match 'send_login_email' => 'nopassword#send_login_email'
  match 'login/:id' => 'nopassword#login'
  match 'logout' => 'nopassword#logout'
  match 'revoke/:id' => 'main#revoke'
end
