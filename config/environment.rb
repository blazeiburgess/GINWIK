ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/sinatra_app_db.sqlite"
)
