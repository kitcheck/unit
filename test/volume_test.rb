require 'test_helper'

class VolumeTest < Minitest::Test
  context "addition" do
    should "add two volumes together" do
      u1 = Unit::Volume.new(5, 'ml')
      u2 = Unit::Volume.new(3, 'ml')
      combined_unit = u1 + u2
      assert_equal 8, combined_unit.scalar.to_f
      assert_equal 'ml', combined_unit.uom
    end

    context "error handling" do
      should "raise on adding mass to volume" do
        u1 = Unit::Mass.new(5, 'mg')
        u2 = Unit::Volume.new(3, 'ml')
        assert_raises Unit::IncompatibleUnitsError do
          u1 + u2
        end
      end
    end
  end
  context "subtraction" do
    should "subtract one volume from another" do
      u1 = Unit::Volume.new(5, 'ml')
      u2 = Unit::Volume.new(3, 'ml')
      combined_unit = u1 - u2
      assert_equal 2, combined_unit.scalar.to_f
      assert_equal 'ml', combined_unit.uom
    end

    context "error handling" do
      should "raise on subtracting a volume from a volume" do
        u1 = Unit::Volume.new(5, 'ml')
        u2 = Unit::Mass.new(3, 'mg')
        assert_raises Unit::IncompatibleUnitsError do
          u1 - u2
        end
      end
    end
  end

  context "equality" do
    context "equivalent units" do
      should "return true" do
        u1 = Unit::Volume.new(1, 'ml')
        u2 = Unit::Volume.new(1, 'ml')
        assert_equal true, u1 == u2
      end
    end
    context "different scalars" do
      should "return false" do
        u1 = Unit::Volume.new(2, 'ml')
        u2 = Unit::Volume.new(1, 'ml')
        assert_equal false, u1 == u2
      end
    end
  end

  context "conversion" do
    [
      ['1 ml', 'l', 0.001],
      ['1 l', 'ml', 1000]
    ].each do |start, dest_uom, expected_scalar|
      should "convert #{start} to #{dest_uom}" do
        vol = Unit.parse(start)
        converted_vol = vol.convert_to(dest_uom)
        assert_equal expected_scalar, converted_vol.scalar
        assert_equal dest_uom, converted_vol.uom
      end
    end
  end
end
