require_relative 'application'
require 'awesome_print'
# require 'bundler'

# ENV['SINATRA_ENV'] ||= 'development'

configure :development, :production do
#   db = URI.parse(ENV['DATABASE_URL'])
#   # set :database, 'sqlite3:db/database.db'
#   set :database, {
#     adapter: db.scheme,
#     host: db.host,
#     username: db.user,
#     password: db.password,
#     database: db.path[1..],
#     encoding: 'unicode'
#   }
  set :database, { :adapter =>'sqlite3', :database=>'chat.db' }
end
# Bundler.require
# ActiveRecord::Base.establish_connection(
#   :adapter => 'sqlite3',
#   :database => 'db/development.sqlite'
# )
# require "sinatra/activerecord/rake"
# require "./app"