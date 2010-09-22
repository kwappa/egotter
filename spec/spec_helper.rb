require 'sequel'
require File.join(File.dirname(File.expand_path(__FILE__)), %w{ .. lib egotter })
egotter = Egotter::Egotter.new :test
