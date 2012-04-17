class UsersController < ApplicationController
  def index
    @tickets = ShowTickets.find_all_by_user_id(cookies.signed[:uid])
  end

  def login
    user_id = -2
    cookies.signed[:uid] = user_id
    conn = ActiveRecord::Base.connection
    if params[:username] == nil or params[:password] == nil
      username = password = ""
    else
      username = params[:username]
      password = params[:password]
      user_id = conn.select_value("select getID('" + username +
                                  "','" + password + "')").to_i
    end

    if user_id == -1
      flash.now[:error] = 'Login failed.'

    elsif user_id > 0
      cookies.signed[:uid] = user_id
      redirect_to :controller => "users", :action => "index"
      #flash.now[:error] = cookies.signed[:uid]
    end
  end

  def editTicket
    @ticket = Ticket.find(params[:ticket_id].to_i)
    #render :json => @ticket
  end

  def newTicket
  end

  def addTicket
    #render :text => "<h1>AddTicket</h1>"
    cid = cookies.signed[:uid]
    sub = params[:subject]
    desc = params[:description]
    #created = Time.new
    @ticket = Ticket.new(:creator_id => cid,
                         :subject => sub,
                         :desciption => desc,
                         :created_at => Time.new.xmlschema
                        )
    if @ticket.save
      redirect_to :controller => "users", :action => "index"
    else
      flash.now[:error] = "Add Failed."
    end 
  end
end
