#!/usr/bin/env ruby

require 'helper'

class ContextTest < Test::Unit::TestCase

  include MicroOSC
  include TestHelper
  
  def test_output
    sleep(0.5)
    received = nil
    port = TestHelper.next_port
    
    server = OSC::EMServer.new(port)
    server.add_method("/test_output") do |message|
      received = message.args[0]
    end 
    Thread.new { server.run }
    
    sleep(0.5)
    
    OSC.using(:output => { :port => port, :host => "localhost" }) do
      output("/test_output", "hi friend")
    end
    
    sleep(0.5)
    
    assert_equal("hi friend", received)
  end
  
  def test_input
    sleep(0.5)
    received = nil
    port = TestHelper.next_port

    OSC.using(:input_port => port) do
      receive("/test_input") do |val|
        received = val
      end
    end    
    sleep(0.5)
    
    client = OSC::Client.new("localhost", port)
    client.send( OSC::Message.new( "/test_input", "hullo from test_input!"))      
    sleep(0.5)
    
    assert_equal("hullo from test_input!", received)  
  end
  
end