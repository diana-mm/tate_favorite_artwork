
require 'sinatra/activerecord'
require 'sqlite3'
require 'require_all'
require 'pry'

require_all 'app'

ActiveRecord::Base.logger = nil

# binding.pry
0