class MergeController < ApplicationController
  post '/merge/:method' do
    
  end

  get '/merge/:method/:id' do
    if is_logged_in?(session)
      
      @method = get_class_name(params[:method]).find(params[:id])
      "#{@method.description}"
      erb :merge
    end
  end
end
