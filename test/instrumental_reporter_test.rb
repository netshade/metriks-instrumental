require 'test_helper'
require 'metriks/reporter/instrumental'

class InstrumentalReporterTest < Test::Unit::TestCase

  def setup
    @registry = Metriks::Registry.new
    @agent    = Instrumental::Agent.new('SOME_TOKEN', :enabled => false)
    @reporter = Metriks::Reporter::Instrumental.new(:registry => @registry, :agent => @agent)
  end

  def teardown
    @reporter.stop
    @registry.stop
  end

  def test_write
    @registry.meter('meter.testing').mark
    @registry.counter('counter.testing').increment
    @registry.timer('timer.testing').update(1.5)
    @registry.histogram('histogram.testing').update(1.5)
    @registry.utilization_timer('utilization_timer.testing').update(1.5)

    @agent.expects(:gauge).at_least(4)
    @agent.expects(:increment).at_least(1)
    @reporter.write
  end

  def test_invalid_arguments()
    assert_raise(::RuntimeError) { Metriks::Reporter::Instrumental.new }
    assert_nothing_thrown { Metriks::Reporter::Instrumental.new(:api_token => "TEST") }
    assert_nothing_thrown { Metriks::Reporter::Instrumental.new(:agent => Instrumental::Agent.new("TEST", :enabled => false)) }
  end
  
end
