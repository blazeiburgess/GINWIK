class SocialGroupsController < ApplicationController

  post '/societies/:slug/social_groups' do
    society = Society.find(get_id(params[:slug]))
    if params[:social_group_id]
      social_group = SocialGroup.find(params[:social_group_id])
      social_group.update(params[:social_group])
    else
      social_group = SocialGroup.create(params[:social_group])
      social_group.society = society
      social_group.save
    end
    redirect to "/societies/#{params[:slug]}/social_groups/#{social_group.id}"
  end

  get '/societies/:slug/social_groups/new' do
    @society = Society.find(get_id(params[:slug]))
    if current_user(session) == @society.user
      @social_group = SocialGroup.new
      erb :'society/social_groups/edit'
    else
      session[:message] = "You can only add social groups to your own societies"
      redirect to "/societies/#{params[:slug]}"
    end
  end

  get '/societies/:slug/social_groups/:social_group_id' do
    @society = Society.find(get_id(params[:slug]))
    @social_group = SocialGroup.find(params[:social_group_id])
    erb :'society/social_groups/show'
  end

  get '/societies/:slug/social_groups/:social_group_id/edit' do 
    @society = Society.find(get_id(params[:slug]))
    if current_user(session) == @society.user
      @social_group = SocialGroup.find(params[:social_group_id])
      erb :'society/social_groups/edit'
    else
      session[:message] = "You can only edit social groups in your own societies"
      redirect to "/societies/#{params[:slug]}/social_groups/#{params[:social_group_id]}"
    end
  end

  post '/societies/:slug/social_groups/:social_group_id/destroy' do
    social_group = SocialGroup.find(params[:social_group_id])
    Conflict.all.each do |conflict|
      conflict.destroy if conflict.group_1_id == social_group.id || conflict.group_2_id == social_group.id
    end
    session[:message] = "#{social_group.name} successfully destroyed"
    social_group.destroy
    redirect to "/societies/#{params[:slug]}"
  end

  get '/societies/:slug/social_groups/:social_group_id/destroy' do
    @society = Society.find(get_id(params[:slug]))
    if current_user(session) == @society.user
      @social_group = SocialGroup.find(params[:social_group_id])
      erb :'society/social_groups/destroy'
    else
      session[:message] = "You can only destroy your own social groups"
      redirect to "/societies/#{params[:slug]}/social_groups/#{params[:social_group_id]}"
    end
  end
end
