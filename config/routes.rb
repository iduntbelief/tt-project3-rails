TtakerRails::Application.routes.draw do
  get "users/index"
  match "users/editTicket" => "users#editTicket", :via => [:get, :post]
  match "users/addTicket" => "users#addTicket", :via => [:get, :post]
  get "users/newTicket"
  match "login" => "users#login", :via => [:get, :post]
  #get "users/updateTicket"
  #match "users/updateTicket" =>
  match "users/updateTicket" => "users#updateTicket", :via => [:get, :post]
end
