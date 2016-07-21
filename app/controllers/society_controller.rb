class SocietyController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/society") }
  enable :sessions

  get '/societies' do 
    erb :index
  end

  get '/societies/:slug' do
    @society = Society.find(params[:slug].split("_")[-1])
    @methods = [:culture, :economic_organization, :education, :environment, :governmental_organization, :history, :language, :technological_development]
    erb :show
  end
end
