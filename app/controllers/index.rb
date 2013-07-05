get '/' do
  @albums = Album.all
  @users = User.all
  erb :index
end

get '/albums/:id' do
  @album = Album.find(params[:id])
  @photos = @album.photos
  erb :album
end

get '/users/:user_id/albums' do
  @user = User.find(params[:user_id])
  @albums = @user.albums
  erb :user
end

get '/photos/:id' do
  @photo = Photo.find(params[:id])
  erb :photo
end
