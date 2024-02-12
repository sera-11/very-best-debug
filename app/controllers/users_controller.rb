class UsersController < ApplicationController

  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/all_users"})
  end
  
  def show
    url_username = params.fetch("path_username")
    matching_users = User.where({ :username => url_username })
    @the_user = matching_users.at(0)

    render({ :template => "user_templates/user_details"})
  end
  
  def create
    @the_user = User.new
    @the_user.username = params.fetch("query_username")
    
    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", {:notice => "User created successfully"})
    else
      redirect_to("/users/#{user.username}", :notice => "User failed to create successfully")
    end
  end
  
  def update
    url_username= params.fetch("path_username")
    matching_users = User.where({ :username => url_username })
    
    @the_user = matching_users.at(0)
    
    @the_user.username = params.fetch("query_username")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}",{ :notice => "User updated successfully"})
    else
      redirect_to("/users/#{@the_user.username}", { :notice => "User failed to update successfully." })
    end
  end

end
