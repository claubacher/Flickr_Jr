post '/login' do
  if User.authenticate(params[:name], params[:password])
    @user = User.authenticate(params[:name], params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = "Username or password was invalid."
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
