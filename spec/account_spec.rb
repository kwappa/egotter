# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'Account parameters' do
  ['LOGIN', 'CONSUMER_KEY', 'CONSUMER_SECRET', 'ACCESS_TOKEN', 'ACCESS_SECRET', 'DB_CONNECTION'].each do |key|
    it "#{key} should be assigned" do
      Egotter.const_get(key).should_not be_nil
    end
  end
end
