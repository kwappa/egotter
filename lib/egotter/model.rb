# -*- coding: utf-8 -*-
module Egotter

  module ModelHelper

    def save_if_different name, data
      last_record = last
      if last_record
        last_list = JSON.parse(last_record["#{name}_list".to_sym])
        return Hash.new if data == last_list
      end
      insert jsonize(name, data)
      return Hash.new unless last_record
      {
        :inc => data - last_list,
        :dec => last_list - data,
      }
    end

    def jsonize name, data
      throw ArgumentError unless data.instance_of?(Array)
      {
        name.to_sym            => data.count,
        "#{name}_list".to_sym  => JSON.generate(data)
      }
    end

    def last
      self.order(:id.desc).first
    end

  end

  class Follower < Sequel::Model
    extend ModelHelper
    def self.save_followers followers_list
      save_if_different 'followers', followers_list
    end
  end

  class Following < Sequel::Model
    extend ModelHelper
    def self.save_followings followings_list
      save_if_different 'followings', followings_list
    end
  end

  class FollowDifference < Sequel::Model
  end

end
