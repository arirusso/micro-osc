#!/usr/bin/env ruby
#
# MicroOSC
# A Ruby DSL for OSC
# (c)2011 Ari Russo and licensed under the Apache 2.0 License
# 

# libs
require "forwardable"

require "osc-access"

# modules

# classes
require "micro-osc/context"
require "micro-osc/state"

module MicroOSC
  
  VERSION = "0.0.1"
  
  module Instructions
  end
  
  def self.using(opts = {}, &block)
    MicroOSC::Context.new(opts[:input], opts[:output], &block)
  end
  
end

module OSC
  
  def self.using(*a, &block)
    MicroOSC.using(*a, &block)
  end
 
end