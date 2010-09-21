require 'sequel'
DB = Sequel.connect 'sqlite://' + File.join(File.dirname(File.expand_path(__FILE__)), %w{ .. .. data egotter_test.db })
require File.join(File.dirname(File.expand_path(__FILE__)), %w{ .. lib egotter })
ENVIRONMENT = :test
