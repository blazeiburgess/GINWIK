class ConflictsController < ApplicationController

  post '/societies/:slug/conflicts' do
    @society = Society.find(get_id(params[:slug])) 
    if params[:conflict_id]
      conflict = Conflict.find(params[:conflict_id])
      conflict.update(params[:conflict]) 
    else
      conflict = Conflict.create(params[:conflict])
      conflict.society = @society
      conflict.save 
    end
    redirect to "/societies/#{params[:slug]}/conflicts/#{conflict.id}"
  end

  get '/societies/:slug/conflicts/new' do
    @society = Society.find(get_id(params[:slug]))
    if @society.social_groups.empty?
      session[:message] = "You can only add a conflict if you have at least one social group created"
      redirect to "/societies/#{params[:slug]}"
    else
      if current_user(session) == @society.user
	@conflict = Conflict.new
	erb :'society/conflicts/edit'
      else
	session[:message] = "You can only add conflict to your own societies"
	redirect to "/societies/#{params[:slug]}"
      end
    end
  end

  get '/societies/:slug/conflicts/:conflict_id' do
    @society = Society.find(get_id(params[:slug]))
    @conflict = Conflict.find(params[:conflict_id])
    @group1 = SocialGroup.find(@conflict.group_1_id)
    @group2 = SocialGroup.find(@conflict.group_2_id)
    erb :'society/conflicts/show'
  end

  get '/societies/:slug/conflicts/:conflict_id/edit' do 
    @society = Society.find(get_id(params[:slug]))
    if current_user(session) == @society.user
      @conflict = Conflict.find(params[:conflict_id])
      erb :'society/conflicts/edit'
    else
      session[:message] = "You can only add conflict to your own societies"
      redirect to "/societies/#{params[:slug]}"
    end
  end

  post '/societies/:slug/conflicts/:conflict_id/destroy' do
    conflict = Conflict.find(params[:conflict_id])
    conflict.destroy
    redirect to "/societies/#{params[:slug]}"
  end

  get '/societies/:slug/conflicts/:conflict_id/destroy' do
    @society = Society.find(get_id(params[:slug]))
    if @society.user == current_user(session) 
      @conflict = Conflict.find(params[:conflict_id])
      erb :'society/conflicts/destroy'
    else
      session[:message] = "You can only destroy your own conflicts"
      redirect to "/societies/#{params[:slug]}/conflicts/#{params[:conflict_id]}"
    end
  end
end
