#!/usr/bin/env ruby
#

module MicroOSC
  
  alias l loop
 
  class << self
    alias_method :m, :using
  end
  
  class Context
    alias_method :o, :output
    alias_method :out, :output
    alias_method :r, :repeat
  end
  
end

def M(*a, &block)
  MIDI.message(*a, &block)  
end
