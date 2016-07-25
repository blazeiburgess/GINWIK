
class UserController < ApplicationController

  post '/users' do
    if all_usernames.include?(params[:user][:username])
      session[:message] = "Username already taken. Please pick another."
      redirect to '/users/new'
    elsif params[:user][:username].empty? || params[:user][:password].empty?
      session[:message] = "Both fields must be filled out"
      redirect to '/users/new'
    else
      if params[:user_id]
	user = User.find(params[:user_id]) 
	user.update(params[:user])
      else
	user = User.create(params[:user])
      end
      session[:user_id] = user.id
      redirect to "/users/#{user.id}"
    end
  end

  get '/users/new' do
    if is_logged_in?(session)
      session[:message] = "You must logout before you can create a new account"
      redirect to "/users/#{current_user(session).id}"
    else
      @user = User.new
      erb :'user/edit' 
    end
  end 

  get '/login' do
    if is_logged_in?(session)
      session[:message] = "You are already logged in"
      redirect to "/users/#{session[:user_id]}"
    else
      erb :'user/login'
    end
  end

  post '/login' do
    user = User.find_by({:username => params[:user][:username]})
    if params[:user][:username].empty? || params[:user][:password].empty?
      session[:message] = "Both fields must be filled out"
      redirect to '/login'
    elsif user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id    
      redirect to "/users/#{user.id}"
    else
      session[:message] = "Username and password combination do not match our records"
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

  post '/users/:id/destroy' do 
    user = User.find(params[:id])
    user.destroy
    session.clear
    session[:message] = "Account has been deleted"
    redirect to '/'
  end

  get '/users/:id/destroy' do 
    if current_user(session) == User.find(params[:id])
      @user = User.find(params[:id])
      erb :'user/destroy'
    else
      session[:message] = "You can only delete your own profile"
      redirect to '/societies'
    end
  end
end
