class SocietyController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views") }
  enable :sessions 

  METHODS = [:culture, :economic_organization, :education, :environment, :governmental_organization, :history, :language, :technological_development]

  get '/societies' do 
    erb :'society/index'
  end

  get '/societies/:slug' do
    @society = Society.find(params[:slug].split("_")[-1])
    
    erb :'society/show'
  end
end
