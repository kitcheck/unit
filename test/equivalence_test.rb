require 'test_helper'

class EquivalenceTest < Minitest::Test
  context "conversion" do
   [
      ['1 meq', 'eq', 0.001],
      ['1 eq', 'meq', 1000],
    ].each do |start, dest_uom, expected_scalar|
      should "convert #{start} to #{dest_uom}" do
        unit = Unit.parse(start)
        converted_unit = unit.convert_to(dest_uom)
        assert_equal expected_scalar, converted_unit.scalar
        assert_equal dest_uom, converted_unit.uom
      end
    end
  end
end
