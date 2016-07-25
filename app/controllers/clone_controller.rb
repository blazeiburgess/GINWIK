class CloneController < ApplicationController
  post '/clone/:society_id' do
    @old_society = Society.find(params[:society_id])
    @society = Society.create(params[:society]) 
    METHODS.each do |method|
      if @old_society.send(method)
	info = @old_society.send(method).attributes	
	info.delete("id")
	info.delete("society_id")
	@society.send("#{method}=", get_class_name(method.to_s).create(info))
      end
    end 
    @old_society.social_groups.each do |social_group|
      info = social_group.attributes
      info.delete("id")
      info["society_id"] = @society.id 
      @society.social_groups << SocialGroup.create(info)
    end    
    @old_society.conflicts.each do |conflict|
      info = conflict.attributes
      info.delete("id")
      old_social_group_1 = SocialGroup.find(conflict.group_1_id)
      old_social_group_2 = SocialGroup.find(conflict.group_2_id)
      binding.pry
      @society.social_groups.each {|sg| info["group_1_id"] = sg.id if sg.description == old_social_group_1.description}
      @society.social_groups.each {|sg| info["group_2_id"] = sg.id if sg.description == old_social_group_2.description}
      info["society_id"] = @society.id 
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
