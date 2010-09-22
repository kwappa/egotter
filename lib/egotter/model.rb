# -*- coding: utf-8 -*-
module Egotter

  module ModelHelper

    def save_if_different name, data
      if last
        return false if JSON.parse(last["#{name}_list".to_sym]) == data
      end
      insert jsonize(name, data)
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

end
