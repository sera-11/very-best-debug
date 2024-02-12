Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/insert_user_record", { :controller => "users", :action => "create" })
  post("/update_user/:path_username", { :controller => "users", :action => "update" })

  get("/venues", { :controller => "venues", :action => "index" })
  post("/insert_venue_record", { :controller => "venues", :action => "create" })
  get("/venues/:path_id", { :controller => "venues", :action => "show" })
  post("/update_venue/:the_id", { :controller => "venues", :action => "update" })
  get("/delete_venue/:path_id", { :controller => "venues", :action => "destroy" })
  
  post("/insert_comment_record", { :controller => "venues", :action => "add_comment" })
end
