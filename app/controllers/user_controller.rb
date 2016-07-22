

class UserController < SocietyController
  post '/users' do
    user = User.find(params[:user_id])
    binding.pry 
    user.update(params[:user])
    redirect to "/users/#{user.id}"
  end

  get '/users/new' do
    @user = User.create
    erb :'user/edit'
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
