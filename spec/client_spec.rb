# -*- coding: utf-8 -*-
require 'spec_helper'

describe Client do
  context 'Authentication' do
    client = Client.new
    limit_status = client.limit_status
    [:reset_time, :remaining_hits, :hourly_limit, :reset_time_in_seconds].each do |key|
      it { limit_status.should be_include key }
    end
  end
end
