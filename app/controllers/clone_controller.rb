class CloneController < ApplicationController
  post '/clone/:society_id' do

  end

  get '/clone/:society_id' do
    @society = Society.find(params[:society_id])
    erb :clone
  end
end
