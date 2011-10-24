#!/usr/bin/env ruby
$:.unshift File.join( File.dirname( __FILE__ ), '../lib')

require "osc"

OSC.using(:input => 8000, :output => { :host => "localhost", :port => 9000 }) do
  
  out("/greeting", "hello!")
  
  receive("/greeting") do |val|
    puts "received #{val}"
  end
  
end
