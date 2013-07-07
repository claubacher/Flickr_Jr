post '/login' do
  if User.authenticate(params[:name], params[:password])
    @user = User.authenticate(params[:name], params[:password])
    session[:user_id] = @user.id
  else
    @errors = "Username or password was invalid."
  end
  @photos = Photo.order("created_at DESC").limit(10)
  @albums = Album.all
  @users = User.all
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end
