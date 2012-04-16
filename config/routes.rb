TtakerRails::Application.routes.draw do
  get "users/index"
  match "users/editTicket" => "users#editTicket", :via => [:get, :post]
  match "login" => "users#login", :via => [:get, :post]
end
