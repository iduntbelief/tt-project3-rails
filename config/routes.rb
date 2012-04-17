TtakerRails::Application.routes.draw do
  get "users/index"
  match "users/editTicket" => "users#editTicket", :via => [:get, :post]
  match "users/addTicket" => "users#addTicket", :via => [:get, :post]
  get "users/newTicket"
  match "login" => "users#login", :via => [:get, :post]
end
