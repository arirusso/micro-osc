#!/usr/bin/env ruby

dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + '/../lib'

require 'test/unit'
require 'micro-osc'

module TestHelper
  
  $port_counter = 8000
  
  def self.next_port
    $port_counter += 1
  end
     
end
