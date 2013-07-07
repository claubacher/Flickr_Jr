get '/' do
  @photos = Photo.order("created_at DESC").limit(10)
  @albums = Album.all
  @users = User.all
  @user = User.find(session[:user_id]) if session[:user_id]
  erb :index
end

get '/users/:user_id/albums' do
  @user = User.find(params[:user_id])
  @albums = @user.albums
  erb :user
end

get '/users/:user_id/albums/:album_id' do
  @user = User.find(params[:user_id])
  @album = Album.find(params[:album_id])
  @photos = @album.photos
  erb :album
end

get '/users/:user_id/albums/:album_id/photos/:photo_id' do
  @user = User.find(params[:user_id])
  @album = Album.find(params[:album_id])
  @photo = Photo.find(params[:photo_id])
  erb :photo
end
