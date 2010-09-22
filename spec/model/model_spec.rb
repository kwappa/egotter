# -*- coding: utf-8 -*-
require 'spec_helper'

describe ModelHelper do
  before :all do
    @helper = Class.new.extend(ModelHelper)
  end

  context 'jsonize data' do
    it { @helper.should be_respond_to :jsonize }
    it 'should raise error when non-array given' do
      lambda{ @helper.jsonize('hoge', nil) }.should raise_error ArgumentError
    end
    it 'should convert array to hash' do
      source = [1,2,3]
      result = @helper.jsonize('piyo', source)
      result[:piyo].should be_eql source.count
      JSON.parse(result[:piyo_list]).should be_eql source
    end
  end
end
