# -*- coding: utf-8 -*-
require 'bundler'
Bundler.setup
require 'rubytter'
autoload :Sequel, 'sequel'

EGOTTER_ROOT = File.join(File.dirname(File.expand_path(__FILE__)), '..')
$: << EGOTTER_ROOT

require 'lib/egotter/account'
require 'lib/egotter/client'

include Egotter

module Egotter

  def db_connect environment
    param = DB_CONNECTION[environment.to_sym]
    raise ArgumentError unless param
    db = Sequel.connect param
    require 'lib/egotter/model'
    return db
  end

  class Egotter
    def initialize environment = 'development'
      @db = db_connect environment
    end
  end

end
