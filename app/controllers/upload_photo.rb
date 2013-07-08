get '/users/:user_id/photos/new' do
  @user = User.find(params[:user_id])
  @albums = @user.albums
  erb :upload_photo
end

post '/photos/new' do
  @user = User.find(session[:user_id])

  @user.file = params[:file]
  # @user.file = File.open("/uploads/" + @user.file.filename)
  @user.save

  filename = "/uploads/" + @user.file.filename

  @album = Album.find_by_name(params[:album])
  @album.photos << Photo.create(:filename => filename)
  @album.save

  redirect "/users/#{session[:user_id]}/albums"
end

get '/albums/new' do
end

post '/albums/new' do
  @album = Album.create(:name => params[:album])
  @album.user = User.find(session[:user_id])
  @album.save
  redirect "/users/#{session[:user_id]}/photos/new"
end