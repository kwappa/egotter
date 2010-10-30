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

  class EgotterError < StandardError ; end


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

    def diff_followers
      client = Client.new
      followings = client.friends_ids  LOGIN
      throw EgotterError unless followings
      followers  = client.followers_ids LOGIN
      throw EgotterError unless followers
      return if followings.empty? || followers.empty?
      following_diff = Following.save_followings(followings)
      follower_diff  = Follower.save_followers(followers)
      FollowDifference.save_differences follower_diff, following_diff
    end

  end

end
