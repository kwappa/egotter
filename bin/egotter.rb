# -*- coding: utf-8 -*-
require File.join(File.dirname(File.expand_path(__FILE__)), %w{ .. lib egotter })
require 'trollop'

SUB_COMMANDS = %w{ diff }
global_opts = Trollop::options do
  banner 'egotter - egoistic twitter toolkit'
  version 'egotter(0.0.1)'
  stop_on SUB_COMMANDS
end

cmd = ARGV.shift
cmd_opts =
  case cmd
  when 'diff'
    @egotter = Egotter::Egotter.new
    @egotter.diff_followers
  else
    Trollop::die "unknown commad #{cmd.inspect}"
  end
