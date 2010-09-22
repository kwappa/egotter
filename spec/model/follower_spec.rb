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
      @source = [0,2,4,6,8]
    end

    it 'should save and restore dummy value' do
      @model.save_followers(@source).should be_true
      last = @model.reverse.first
      JSON.parse(last.followers_list).should be_eql @source
      last.followers.should be_eql @source.count
    end

    it 'should not save same as last value' do
      @model.save_followers(@source).should_not be_true
    end

    it 'should save difference as last value' do
      @model.save_followers(@source + @source).should be_true
      @model.count.should be_eql 2
    end

  end

end
