TtakerRails::Application.routes.draw do
  get "users/index"
  match "login" => "users#login", :via => [:get, :post]
end
