require 'test_helper'

class UnitTest < Minitest::Test
  context "different units" do
    setup do
      @u1 = Unit::Unit.new(1, 'ea')
      @u2 = Unit::Unit.new(1, 'unit')
    end

    should "not allow you to operate on two unitless objects of different uom" do
      [:+, :-, :/, :<].each do |operation|
        assert_raises Unit::IncompatibleUnitsError do
          @u1.send(operation, @u2)
        end
      end
    end
  end

  context "division" do
    context "dividing by volume" do
      should "create a concentration" do
        u1 = Unit::Unit.new(10, 'unit')
        u2 = Unit::Volume.new(1, 'ml')
        conc = u1/u2

        assert_equal true, conc.concentration?
        assert_equal 10, conc.scalar
        assert_equal "unit/ml", conc.uom
      end
    end
  end

  context "conversion" do
    context "to another unit" do
      should "blow up" do
        u1 = Unit::Unit.new(10, 'unit')
        assert_raises Unit::IncompatibleUnitsError do
          u1 >> 'meq'
        end
      end
    end
  end
end
