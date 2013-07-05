get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new(:name => params[:name])
  @user.password = params[:password]
  if @user.valid?
    @user.albums << Album.create(:name => "My First Album")
    @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}/albums"
  else
    @errors = @user.errors.full_messages
    erb :signup
  end
end
