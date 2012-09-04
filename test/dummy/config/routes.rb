Rails.application.routes.draw do
  root :to => "application#index"
  mount Nopassword::Engine => "/nopassword"
end
