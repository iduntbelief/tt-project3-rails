class UsersController < ApplicationController
  def index
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
      #redirect_to :controller => "users", :action => "index"
      flash.now[:error] = cookies.signed[:uid]
    end
  end

end
