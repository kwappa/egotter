# -*- coding: utf-8 -*-
require 'spec_helper'

describe Follower do

  before :all do
    DB = db_connect 'test'
    @model = Object.const_get('Follower')
    @model.truncate
  end

  context 'save followers' do
    before do
      @source = [0,8,4,2,6]
    end

    it 'should save and restore dummy value' do
      @model.save_followers(@source).should be_empty
      last = @model.reverse.first
      JSON.parse(last.followers_list).should be_eql @source
      last.followers.should be_eql @source.count
    end

    it 'should not save same as last value' do
      @model.save_followers(@source).should be_empty
    end

    it 'should save difference as last value' do
      @model.save_followers(@source << 10).should_not be_empty
      @model.count.should be_eql 2
    end

    it 'should return increment / decrement' do
      new_source = [0,2,4,12]
      diff = @model.save_followers(new_source)
      diff[:dec].sort.should be_eql ((@source << 10) - new_source).sort
      diff[:inc].sort.should be_eql (new_source - (@source << 10)).sort
    end

  end

end
