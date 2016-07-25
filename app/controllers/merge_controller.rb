class MergeController < ApplicationController
  post '/merge/:method' do
    @society = Society.find(get_params_method(params)[:society_id])
    # @old_method = get_class_name(params[:old_method_id]).find
    if @society.send(params[:method].to_sym)
      @society.send(params[:method].to_sym).update(get_params_method(params))
    else
      @society.send("#{params[:method].to_sym}=", get_class_name(params[:method]).new(get_params_method(params)))
      @society.send(params[:method].to_sym).save
      # @society.save
    end
    redirect to "/societies/#{get_slug(@society)}/#{params[:method]}"
  end

  get '/merge/:method/:id' do
    if is_logged_in?(session)
      @method = get_class_name(params[:method]).find(params[:id])
      "#{@method.description}"
      erb :merge
    else
      session[:message] = "You can only merge data when logged in"
      redirect to '/login'
    end
  end
end
