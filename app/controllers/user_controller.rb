

class UserController < SocietyController
  post '/users' do
    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect to "/users/#{user.id}"
  end

  get '/users/new' do
    erb :'user/new'
  end 

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'user/show'
  end
end
