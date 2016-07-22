class SocietyController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views") }
  enable :sessions 

  METHODS = [:culture, :economic_organization, :education, :environment, :governmental_organization, :history, :language, :technological_development]

  get '/societies' do 
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
    erb :'society/edit'
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
    @method = @society.send(params[:method].to_sym) 
    erb :'society/method/edit'
  end

  get '/societies/:slug/:method/new' do
    @society = Society.find(params[:slug].split("_")[-1]) 
    @method = Kernel.const_get(params[:method].split("_").map(&:capitalize).join).create
    @society.send("#{params[:method].to_sym}=", @method) 
    @society.save
    @society.send(params[:method].to_sym).save
    erb :'society/method/edit'
  end
end
