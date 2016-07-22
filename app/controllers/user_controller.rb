
class UserController < ApplicationController

  post '/users' do
    if params[:user_id]
      user = User.find(params[:user_id]) 
      user.update(params[:user])
    else
      user = User.create(params[:user])
    end
    session[:user_id] = user.id
    redirect to "/users/#{user.id}"
  end

  get '/users/new' do
    @user = User.new
    erb :'user/edit'
  end 

  get '/login' do
    erb :'user/login'
  end

  post '/login' do
    user = User.find_by({:username => params[:user][:username]})  
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id    
      redirect to "/users/#{user.id}"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

  get '/users/:id' do
    @user = User.find(params[:id])    
    erb :'user/show'
  end

  get '/users/:id/edit' do
    if current_user(session) == User.find(params[:id])
      @user = User.find(params[:id])
      erb :'user/edit'
    else
      session[:message] = "You can only edit your own profile"
      redirect to '/societies'
    end
  end
end
