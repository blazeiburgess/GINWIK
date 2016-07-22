

class UserController < SocietyController
  post '/users' do
    binding.pry
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

  get '/users/login' do
    erb :'user/login'
  end

  post '/users/login' do
    user = User.find
  end

  get '/users/:id' do
    @user = User.find(params[:id]) 
    erb :'user/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'user/edit'
  end
end
