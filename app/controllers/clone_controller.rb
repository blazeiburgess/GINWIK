class CloneController < ApplicationController
  post '/clone/:society_id' do
    @old_society = Society.find(params[:society_id])
    @society = Society.create(params[:society])
    METHODS.each do |method|
      @society.send("#{method}=", @old_society.send(method))
    end
    @society.save
    redirect to "/societies/#{get_slug(@society)}"
  end

  get '/clone/:society_id' do
    @society = Society.find(params[:society_id])
    erb :clone
  end
end
