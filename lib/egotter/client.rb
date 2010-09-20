# -*- coding: utf-8 -*-
class Egotter::Client

  def initialize
    consumer = ::OAuth::Consumer.new(
                                     CONSUMER_KEY,
                                     CONSUMER_SECRET,
                                     :site => 'http://twitter.com'
                                     )
    token = ::OAuth::AccessToken.new(
                                     consumer,
                                     ACCESS_TOKEN,
                                     ACCESS_SECRET
                                     )
    @client = ::OAuthRubytter.new(token)
  end

  def method_missing name, *args
    if @client.respond_to? name
      @client.send(name, *args)
    end
  end

end
