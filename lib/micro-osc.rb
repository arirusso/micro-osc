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
  
  def self.using(options = {}, &block)
    MicroOSC::Context.new(options, &block)
  end
  
end

# define this module again to avoid overwriting another OSC module
module OSC
  
  def self.using(*a, &block)
    MicroOSC.using(*a, &block)
  end
 
end

require "micro-osc/shorthand"
