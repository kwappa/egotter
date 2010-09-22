# -*- coding: utf-8 -*-
require 'spec_helper'

describe Following do

  before :all do
    DB = db_connect 'test'
    @model = Object.const_get('Following')
    @model.truncate
  end

  context 'save followings' do
    before do
      @source = [15,9,8,17,24,53,17,0,0,24,0]
    end

    it 'should save and restore dummy value' do
      @model.save_followings(@source).should be_empty
      last = @model.reverse.first
      JSON.restore(last.followings_list).should be_eql @source
      last.followings.should be_eql @source.count
    end

    it 'should not save same as last value' do
      @model.save_followings(@source).should be_empty
    end

    it 'should save difference as last value' do
      @model.save_followings(@source << 10).should_not be_empty
      @model.count.should be_eql 2
    end

    it 'should return increment / decrement' do
      new_source = [0,2,4,12]
      diff = @model.save_followings(new_source)
      diff[:dec].sort.should be_eql ((@source << 10) - new_source).sort
      diff[:inc].sort.should be_eql (new_source - (@source << 10)).sort
    end

  end

end
