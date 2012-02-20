require "rubygems"
require "rspec"
require "active_record"

require File.expand_path(File.dirname(__FILE__) + "/../lib/validates_cpf")

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
require File.dirname(__FILE__) + "/fake_app/db/create_users"

CreateUsers.migrate(:up)