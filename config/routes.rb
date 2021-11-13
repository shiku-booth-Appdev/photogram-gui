Rails.application.routes.draw do

 get("/", { :controller => "users", :action => "index"})

 get("/users", { :controller => "users", :action => "index"})

 get("/users/:path_username", { :controller => "users", :action => "show"})

 get("/insert_user/", { :controller => "users", :action => "insert_user"})

 get("/update_user/:modify_id", { :controller => "users", :action => "update_user"})

 get("/photos", { :controller => "photos", :action => "index"})

 get("/photos/:path_photo_id", { :controller => "photos", :action => "show"})

 get("/delete_photo/:path_delete_photo_id", { :controller => "photos", :action => "delete_photo"})

 get("/insert_photo/", { :controller => "photos", :action => "insert_photo"})

 get("/update_photo/:modify_id", { :controller => "photos", :action => "update_photo"})

 get("/add_comment/:modify_id", { :controller => "photos", :action => "add_photo_comment"})

end
