class SocietyController < ApplicationController

  METHODS = [:culture, :economic_organization, :education, :environment, :governmental_organization, :history, :language, :technological_development]

  get '/societies' do 
    
    @message = session.delete(:message)
    erb :'society/index'
  end

  post '/societies' do
    if params[:society_id]
      @society = Society.find(params[:society_id])
      @society.update(params[:society])
    else
      Society.create(params[:society])
    end
    redirect to '/societies'
  end

  get '/societies/new' do
    @society = Society.new 
    erb :'society/edit'
  end

  get '/societies/:slug' do
    @society = Society.find(params[:slug].split("_")[-1])    
    erb :'society/show'
  end

  get '/societies/:slug/edit' do
    @society = Society.find(params[:slug].split("_")[-1])    
    if current_user(session).id == @society.user.id
      erb :'society/edit'
    else
      session[:message] = "You can only edit your own socities"
      redirect to '/societies'
    end
  end

  get '/societies/:slug/:method' do
    @society = Society.find(params[:slug].split("_")[-1]) 
    @method = @society.send(params[:method].to_sym)
    erb :'society/method/show'
  end

  post '/societies/:slug/:method' do
    @society = Society.find(params[:slug].split("_")[-1]) 
    @method = @society.send(params[:method].to_sym)
    @method.update(params[params[:method].to_sym]) 
    redirect to "/societies/#{params[:slug]}/#{params[:method]}"
  end

  get '/societies/:slug/:method/edit' do
    @society = Society.find(params[:slug].split("_")[-1]) 
    if current_user(session) == @society.user
      @method = @society.send(params[:method].to_sym) 
      erb :'society/method/edit'
    else
      session[:message] = "You can only edit your own entries"
      redirect to '/societies'
    end
  end

  get '/societies/:slug/:method/new' do
    @society = Society.find(params[:slug].split("_")[-1]) 
    if current_user(session) == @society.user
      @method = Kernel.const_get(params[:method].split("_").map(&:capitalize).join).create
      @society.send("#{params[:method].to_sym}=", @method) 
      @society.save 
      @society.send(params[:method].to_sym).save
      erb :'society/method/edit'
    else
      session[:message] = "You can only create entries under your own societies"
      redirect to '/societies'
    end
  end
end
