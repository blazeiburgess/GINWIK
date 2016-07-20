require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'
require 'shotgun'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/sinatra_app_db.sqlite"
)

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
