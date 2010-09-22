# -*- coding: utf-8 -*-
require 'spec_helper'

describe FollowDifference do

  before :all do
    DB = db_connect 'test'
    @model = Object.const_get('FollowDifference')
    @model.truncate
  end

  context 'save differences' do

    it 'should return false if empty hashes are given' do
      @model.save_differences(Hash.new, Hash.new).should be_false
    end

    it 'should save valid hashes are given' do
      followers = {
        :inc => [0,1],
        :dec => [2,3],
      }
      followings = {
        :inc => [5,7],
        :dec => [6,8],
      }
      @model.save_differences(followers, followings).should be_true
      last_diff = @model.last
      JSON.parse(last_diff[:followed]).should be_eql  followers[:inc]
      JSON.parse(last_diff[:removed]).should be_eql   followers[:dec]
      JSON.parse(last_diff[:following]).should be_eql followings[:inc]
      JSON.parse(last_diff[:removing]).should be_eql  followings[:dec]
    end

  end

end
