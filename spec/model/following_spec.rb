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
      @source = [0,2,4,6,8]
    end

    it 'should save and restore dummy value' do
      @model.save_followings(@source).should be_true
#       last = @model.reverse.first
#       Marshal.restore(last.followings_list).should be_eql @source
#       last.followings.should be_eql @source.count
    end

#     it 'should not save same as last value' do
#       @model.save_followings(@source).should_not be_true
#     end

#     it 'should save difference as last value' do
#       @model.save_followings(@source + @source).should be_true
#       @model.count.should be_eql 2
#     end

  end

end
