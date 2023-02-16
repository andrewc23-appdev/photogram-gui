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

end
