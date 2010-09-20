# -*- coding: utf-8 -*-
require 'bundler'
Bundler.setup
require 'rubytter'

$: << File.dirname(File.expand_path(__FILE__))
require 'egotter/account'
require 'egotter/client'

include Egotter

module Egotter
  class Egotter
  end
end
