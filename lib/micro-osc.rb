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
  
end

module OSC
  
  def using(opts = {}, &block)
    MicroOSC.block(&block)
  end
  
end