# models/request.rb
require 'active_record'

class Request < ActiveRecord::Base
  serialize :files
end

