class MethodController < ApplicationController

  get '/societies/:slug/:method' do
    @society = Society.find(get_id(params[:slug]))  
    @method = @society.send(params[:method].to_sym)
    session[:page_title] = "GINWIK - #{params[:method]}, #{@society.name} by #{@society.user.username}"
    erb :'society/method/show'
  end

  post '/societies/:slug/:method' do
    if params[params[:method].to_sym][:description].empty?
      session[:message] = "You must fill out a description"
      redirect to "/societies/#{params[:slug]}/#{params[:method]}/edit"
    else
      @society = Society.find(get_id(params[:slug])) 
      @method = @society.send(params[:method].to_sym)
      @method.update(params[params[:method].to_sym]) 
      redirect to "/societies/#{params[:slug]}/#{params[:method]}"
    end
  end

  get '/societies/:slug/:method/edit' do
    @society = Society.find(get_id(params[:slug])) 
    if current_user(session) == @society.user
      @method = @society.send(params[:method].to_sym) 
      erb :'society/method/edit'
    else
      session[:message] = "You can only edit your own entries"
      redirect to '/societies'
    end
  end

  get '/societies/:slug/:method/new' do
    @society = Society.find(get_id(params[:slug])) 
    if current_user(session) == @society.user
      @method = get_class_name(params[:method]).create
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
