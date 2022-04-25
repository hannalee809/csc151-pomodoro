require_relative "timer.rb"
require "test/unit"
 
class TestTimer < Test::Unit::TestCase
 
  def seconds_to_hms_test
    assert_equal("00:01:00", seconds_to_hms(60) )
  end
 
end