class ApplicationController < Sinatra::Base
  include Helpers
  set :views, Proc.new { File.join(root, "../views/") }
  set :public_folder, Proc.new { File.join(root, "../public/") }
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do 
    session[:home_page] = true
    erb :home
  end
end
