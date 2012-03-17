#!/usr/bin/env ruby
#

module MicroOSC
  
  class Context
    
    include OSCAccessible
    
    extend Forwardable
    
    attr_reader :state
    
    def_delegator :state, :output_cache, :cache
    
    alias_method :join, :osc_join
    alias_method :output, :osc_send
    alias_method :receive, :osc_receive
    alias_method :wait_for_input, :osc_join
            
    def initialize(options = {}, &block)
      @state = State.new
      osc_start(options)
      edit(&block) if block_given?
    end
    
    # open a block for editing/live coding in this Context
    def edit(&block)
      self.instance_eval(&block)
    end
    
    def receive(pattern, options = {}, &block)
      osc_receive(pattern, options) { |target_obj, val| yield(val) }
    end
    
    # repeat the last command
    def repeat
      self.send(@state.last_command[:method], *@state.last_command[:args]) unless @state.last_command.nil?
    end
    
    # shortcut to an array of port numbers
    def input_ports
      @osc_receiver.servers.keys
    end
    
    def method_missing(m, *a, &b)
      outp = nil
      options = a.last.kind_of?(Hash) ? a.last : {}
      do_output = options[:output] || true
      outp = super
      @state.record(m, a, b, outp)
    end
        
  end
end