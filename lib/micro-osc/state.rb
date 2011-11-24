#!/usr/bin/env ruby
#
module MicroOSC

  class State
    
    Default = {
      :channel => 0,
      :octave => 2,
      :velocity => 100
    }
    
    attr_accessor :auto_output,
                  :pattern,
                  :super_sticky
    
    attr_reader :inputs,
                :last_command,
                :outputs,
                :output_cache
        
    def initialize(ins, outs, options = {})
      @auto_output = true
      @last_command = nil    
      @super_sticky = false

      @channel = options[:channel] || Default[:channel]
      @velocity = options[:velocity] || Default[:velocity]
      @octave = options[:octave] || Default[:octave]  
      
      @inputs = ins
      @outputs = outs  
    end
    
    def record(m, a, b, outp)
      ts = now
      @output_cache << { :message => outp, :timestamp => ts }
      @last_command = { :method => m, :args => a, :block => b, :timestamp => ts }
    end
    
    def toggle_super_sticky
      @super_sticky = !@super_sticky
    end
    
    def toggle_auto_output
      @auto_output = !@auto_output
    end

    def message_properties(opts, *props)
      output = {}
      props.each do |prop|
        output[prop] = opts[prop]
        self.send("#{prop.to_s}=", output[prop]) if !output[prop].nil? && (self.send(prop).nil? || @super_sticky)
        output[prop] ||= self.send(prop.to_s)
      end
      output
    end
   

  end

end