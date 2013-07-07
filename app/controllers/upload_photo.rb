get '/users/:user_id/photos/new' do
  @user = User.find(params[:user_id])
  @albums = @user.albums
  erb :upload_photo
end

post '/photos/new' do
  puts params[:file]

  @user = User.find(session[:user_id])

  @user.file = params[:file]
  @user.save
  
  puts @user.file

  filename = "/uploads/" + @user.file.filename

  @album = Album.find_by_name(params[:album])
  @album.photos << Photo.create(:filename => filename)
  @album.save

  redirect "/users/#{session[:user_id]}/albums"
end
