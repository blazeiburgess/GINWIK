class SocietyController < ApplicationController

  get '/societies' do  
    session[:page_title] = "GINWI - Societies" 
    session[:home_page] = true
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
    if is_logged_in?(session)
      @society = Society.new 
      erb :'society/edit'
    else
      session[:message] = "You need an account to create a new entry"
      redirect to "/login"
    end
  end

  get '/societies/:slug' do
    @society = Society.find(get_id(params[:slug]))    
    session[:page_title] = "GINWI - #{@society.name} by #{@society.user.username}"
    erb :'society/show'
  end

  get '/societies/:slug/edit' do
    @society = Society.find(get_id(params[:slug]))
    if current_user(session).id == @society.user.id
      erb :'society/edit'
    else
      session[:message] = "You can only edit your own socities"
      redirect to '/societies'
    end
  end

  get '/societies/:slug/:method' do
    @society = Society.find(get_id(params[:slug]))  
    @method = @society.send(params[:method].to_sym)
    session[:page_title] = "GINWI - #{params[:method]}, #{@society.name} by #{@society.user.username}"
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
