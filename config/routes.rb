Rails.application.routes.draw do 
  match 'send_login_email' => 'nopassword/nopassword#send_login_email'
  match 'login/:id/:code' => 'nopassword/nopassword#login'
  match 'logout' => 'nopassword/nopassword#logout'
  match 'revoke/:id' => 'nopassword/nopassword#revoke'
end
