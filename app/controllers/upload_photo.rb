get '/photos/new' do
  @user = User.find(params[:user_id])
  @albums = @user.albums
  erb :upload_photo
end

post '/photos/new' do
  album = Album.find_by_name(params[:album])
  album.photos << Photo.create(:filename => params[:filename])
  redirect '/photos/new'
end
