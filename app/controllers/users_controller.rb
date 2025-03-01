class UsersController < ApplicationController
  
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})

    render({:template => "user_templates/index.html.erb"})
  end

  def show
    input_username = params.fetch("path_username")
    matching_users = User.where({:username => input_username})
    @the_user = matching_users.first

    if @the_user == nil
      redirect_to("/404")
    else
      render({:template => "user_templates/show.html.erb"})
    end
  end

  def create

    #Parameters: {"query_image"=>"asdf", "query_caption"=>"asdf", "query_owner_id"=>"asdf"}
    input_username = params.fetch("input_username")


    a_new_user = User.new

    a_new_user.username = input_username

    a_new_user.save

    redirect_to("/users/" + a_new_user.username.to_s)

    #render({:template => "photo_templates/create.html.erb"})
  end

  def update

    the_id = params.fetch("modify_id")
    the_user = User.where({:id => the_id}).first

    input_username = params.fetch("input_username")

    the_user.username = input_username


    the_user.save

    redirect_to("/users/" + the_user.username.to_s)
    #render({:template => "photo_templates/update.html.erb"})

  end

end
