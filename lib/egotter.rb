# -*- coding: utf-8 -*-
require 'bundler'
Bundler.setup
require 'rubytter'
autoload :Sequel, 'sequel'

EGOTTER_ROOT = File.join(File.dirname(File.expand_path(__FILE__)), '..')
$: << EGOTTER_ROOT

require 'lib/egotter/account'
require 'lib/egotter/client'
require 'lib/egotter/model'

include Egotter

module Egotter
  class Egotter
  end
end
