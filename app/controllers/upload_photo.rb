get '/users/:user_id/photos/new' do
  erb :upload_photo
end

post '/photos/new' do
  @album = current_user.albums.find_by_name(params[:album])
  
  @photo = Photo.new
  @photo.file = params[:file] 
  @album.photos << @photo

  current_user.save

  redirect "/users/#{session[:user_id]}/albums"
end

get '/albums/new' do
end

post '/albums/new' do
  @album = current_user.albums.create(:name => params[:album]) 
  redirect "/users/#{session[:user_id]}/photos/new"
end