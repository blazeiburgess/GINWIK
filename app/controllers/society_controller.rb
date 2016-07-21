class SocietyController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views") }
  enable :sessions 

  get '/societies' do 
    erb :'society/index'
  end

  get '/societies/:slug' do
    @society = Society.find(params[:slug].split("_")[-1])
    @methods = [:culture, :economic_organization, :education, :environment, :governmental_organization, :history, :language, :technological_development]
    erb :'society/show'
  end
end
