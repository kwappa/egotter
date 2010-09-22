# -*- coding: utf-8 -*-
module Egotter

   class FollowerHistory < Sequel::Model
     def self.save_followers followers
       insert :followers => Marshal.dump(followers)
     end
   end

   class FollowingHistory < Sequel::Model
   end

end
