get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:user])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = "This combination of email and password is invalid as fuck"
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect '/meals'
end
