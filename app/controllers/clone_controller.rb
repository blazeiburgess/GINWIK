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
    
    redirect to "/societies/#{get_slug(@society)}"
  end

  get '/clone/:society_id' do
    @society = Society.find(params[:society_id])
    erb :clone
  end
end
