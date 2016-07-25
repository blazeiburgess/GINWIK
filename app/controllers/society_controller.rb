class SocietyController < ApplicationController

  get '/societies' do  
    session[:page_title] = "GINWIK - Societies" 
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
    session[:page_title] = "GINWIK - #{@society.name} by #{@society.user.username}"
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

  post '/societies/:slug/destroy' do
    @society = Society.find(get_id(params[:slug]))
    session[:message] = "#{@society.name} has been permanently deleted."
    @society.destroy
    redirect to '/societies'
  end

  get '/societies/:slug/destroy' do
    @society = Society.find(get_id(params[:slug]))
    if current_user(session) == @society.user
      erb :'society/destroy'
    else
      session[:message] = "You can only delete your own entries"
      redirect to "/societies/#{params[:slug]}"
    end
  end
end
