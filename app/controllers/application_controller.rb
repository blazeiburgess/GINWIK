class ApplicationController < Sinatra::Base
  include Helpers
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do 
    erb :home
  end
end
