Nopassword::Application.routes.draw do
  root :to => 'nopassword#index'
  match 'send_login_email' => 'nopassword#send_login_email'
  match 'login/:id' => 'nopassword#login'
  match 'logout' => 'nopassword#logout'
  match 'revoke/:id' => 'nopassword#revoke'
end
