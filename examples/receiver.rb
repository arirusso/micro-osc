#!/usr/bin/env ruby
$:.unshift File.join( File.dirname( __FILE__ ), '../lib')

require "osc"

OSC.using(:input_port => 8000) do
  
  receive("/greeting") { |val| p "received #{val}" }

  p "Ready to receive OSC messages on port(s) #{input_ports.join(', ')}..."
    
  wait_for_input

end
