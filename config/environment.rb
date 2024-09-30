# config/environment.rb

require 'active_record'
require 'yaml'
require 'sinatra/activerecord'

db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.configurations = db_config
ActiveRecord::Base.establish_connection(db_config[Sinatra::Base.environment.to_s])

