class MergeController < ApplicationController
  post '/merge/:method' do
    @society = Society.find(get_params_method(params)[:society_id])
    if @society.send(params[:method].to_sym)
      @method = get_class_name(params[:method]).update(get_params_method(params))     
    else
      @method = get_class_name(params[:method]).create(get_params_method(params))    
      @method.save
    end
    redirect to "/societies/#{get_slug(@method.society)}/#{params[:method]}"
  end

  get '/merge/:method/:id' do
    if is_logged_in?(session)
      
      @method = get_class_name(params[:method]).find(params[:id])
      "#{@method.description}"
      erb :merge
    end
  end
end
