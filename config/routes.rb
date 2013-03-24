Rails.application.routes.draw do 
  post 'send_login_email' => 'nopassword/nopassword#send_login_email'
  get 'login/:id/:code' => 'nopassword/nopassword#login'
  delete 'logout' => 'nopassword/nopassword#logout'
  delete 'revoke/:id' => 'nopassword/nopassword#revoke'
end
