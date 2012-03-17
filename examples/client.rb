#!/usr/bin/env ruby
$:.unshift File.join( File.dirname( __FILE__ ), '../lib')

require "osc"

OSC.using(:output => { :host => "localhost", :port => 8000 }) do
  
  out "/greeting", "hullo!"

end
