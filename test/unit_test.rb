require 'test_helper'

class UnitTest < Minitest::Test
  context "different units" do
    setup do
      @u1 = Unit::Unit.new(1, 'ea')
      @u2 = Unit::Unit.new(1, 'meq')
    end
    
    should "not allow you to operate on two unitless objects of different uom" do
      [:+, :-, :/, :<].each do |operation|
        assert_raises Unit::IncompatibleUnitsError do
          @u1.send(operation, @u2)
        end
      end
    end
  end
end
