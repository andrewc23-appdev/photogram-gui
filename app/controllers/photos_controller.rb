class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order(:created_at => :desc)


    render({:template => "photo_templates/index.html.erb"})
  end

  def show
    url_id = params.fetch("path_id")
    @the_photo = Photo.where({:id => url_id}).first
    render({:template => "photo_templates/show.html.erb"})
  end

  def baii
    the_id = params.fetch("toast_id")
    the_photo = Photo.where({:id => the_id}).first
    the_photo.destroy

    redirect_to("/photos")

    #render({:template => "photo_templates/baii.html.erb"})
  end

  def create

    #Parameters: {"query_image"=>"asdf", "query_caption"=>"asdf", "query_owner_id"=>"asdf"}
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)

    #render({:template => "photo_templates/create.html.erb"})
  end

  def update

    the_id = params.fetch("modify_id")
    the_photo = Photo.where({:id => the_id}).first

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
    #render({:template => "photo_templates/update.html.erb"})

  end


  def comment_new
    #add_comment?query_photo_id=953&query_auhtor_id=81&query_comment=adfasdf
    input_photo_id = params.fetch("query_photo_id")
    input_author_id = params.fetch("query_auhtor_id")
    input_comment = params.fetch("query_comment")

    a_new_comment = Comment.new

    a_new_comment.photo_id = input_photo_id
    a_new_comment.author_id = input_author_id
    a_new_comment.body = input_comment

    a_new_comment.save

    redirect_to("/photos/" + a_new_comment.photo_id.to_s)
  end

  
end
