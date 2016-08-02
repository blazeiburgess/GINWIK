class CloneController < ApplicationController
  post '/clone/:society_id' do
    @old_society = Society.find(params[:society_id])
    @society = Society.create(params[:society]) 
    METHODS.each do |method|
      if @old_society.send(method)
	info = clean_attrs_of_ids(@old_society.send(method))
	@society.send("#{method}=", get_class_name(method.to_s).create(info))
      end
    end 
    @old_society.social_groups.each do |social_group|
      info = clean_attrs_of_ids(social_group, @society)
      @society.social_groups << SocialGroup.create(info)
    end    
    @old_society.conflicts.each do |conflict|
      info = clean_attrs_of_ids(conflict) 
      migrate_conflict(conflict, @society)
      @society.conflicts << Conflict.create(info)
    end    
    redirect to "/societies/#{get_slug(@society)}"
  end

  get '/clone/:society_id' do
    if is_logged_in?(session)
      @society = Society.find(params[:society_id])
      erb :clone
    else
      session[:message] = "You can only clone when you're logged in"
      redirect to '/login'
    end
  end
end
