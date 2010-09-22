# -*- coding: utf-8 -*-
require 'spec_helper'

describe FollowerHistory do

  before :all do
    DB = db_connect 'test'
    @model = Object.const_get('FollowerHistory')
    @model.truncate
  end

  context 'save followers' do
    it 'should save and restore dummy value' do
      @model.save_followers('fuga').should be_true
      last = @model.reverse.first
      Marshal.restore(last.followers).should be_eql 'fuga'
    end
  end

end
