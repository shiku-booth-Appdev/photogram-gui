class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    url_photo_id = params.fetch("path_photo_id")

    matching_photos = Photo.where({ :id => url_photo_id})

    @the_photo = matching_photos.first

    if @the_photo == nil
     redirect_to("/404")
    else
     render({ :template => "photo_templates/show.html.erb"})
    end
  end

  def delete_photo
    url_delete_photo_id = params.fetch("path_delete_photo_id")

    matching_photos = Photo.where({ :id => url_delete_photo_id})

    the_photo = matching_photos.first

    the_photo.destroy

    redirect_to("/photos")

  end

  def insert_photo
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new 

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)

  end

  def update_photo
    update_photo_id = params.fetch("modify_id")
    update_image = params.fetch("query_image")
    update_caption = params.fetch("query_caption")
    

    matching_photos = Photo.where({ :id => update_photo_id})

    the_photo = matching_photos.first

    the_photo.image = update_image
    the_photo.caption = update_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)

  end
  
  def add_photo_comment
    update_photo_id = params.fetch("modify_id")
    insert_author_id = params.fetch("query_author_id")
    insert_comment = params.fetch("query_comment")
    
    a_new_comment = Comment.new 

    a_new_comment.photo_id = update_photo_id
    a_new_comment.author_id = insert_author_id
    a_new_comment.body = insert_comment

    a_new_comment.save

    redirect_to("/photos/" + update_photo_id.to_s)

  end
end