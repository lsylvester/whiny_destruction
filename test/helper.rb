require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'active_support'
require 'active_record'

# setup database adapter
ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3",
  :database => File.dirname(__FILE__) + "/test.sqlite3"
})
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'whiny_destruction'
require 'models/destroyable'

CreateDestroyables.migrate(:up) unless Destroyable.table_exists?

class Test::Unit::TestCase
end
