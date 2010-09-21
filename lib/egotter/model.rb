# -*- coding: utf-8 -*-
module Egotter

  def db_connect environment
    param = DB_CONNECTION[environment.to_sym]
    raise ArgumentError unless param
    Sequel.connect param
  end

end
