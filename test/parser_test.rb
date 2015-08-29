require 'test_helper'

class ParserTest < Minitest::Test
  context "#parse" do
    context "mass" do
      should "parse a normal mass" do
        mass = Unit::Parser.new("5 mg").parse

        assert_equal true, mass.mass?
        assert_equal 5.0, mass.scalar
        assert_equal "mg", mass.uom
      end

      should "parse a weird mass" do
        mass = Unit::Parser.new("@ 5 mg").parse

        assert_equal true, mass.mass?
        assert_equal 5.0, mass.scalar
        assert_equal "mg", mass.uom
      end

      should "Throw an error with weird slash" do
        assert_raises Unit::IncompatibleUnitsError do
          Unit::Parser.new("5 mg /").parse
        end
      end

      should "Handle capitalization" do
        mass = Unit::Parser.new("5 Mg").parse
        assert_equal true, mass.mass?
        assert_equal 5.0, mass.scalar
        assert_equal "mg", mass.uom
      end
    end

    context "volume" do
      should "parse a volume" do
        vol = Unit::Parser.new("3 ml").parse

        assert_equal true, vol.volume?
        assert_equal 3.0, vol.scalar
        assert_equal "ml", vol.uom
      end
    end

    context "concentration" do
      should "parse a normal concentration" do
        conc = Unit::Parser.new("5 mg / 2 ml").parse

        assert_equal true, conc.concentration?
        assert_equal 2.5, conc.calculated_scalar
        assert_equal "mg/ml", conc.calculated_uom
      end

      should "parse a poorly constructed concentration" do
        conc = Unit::Parser.new("5 mg $/ 2 ml").parse

        assert_equal true, conc.concentration?
        assert_equal 2.5, conc.g
        assert_equal "mg/ml", conc.uom
      end
    end
  end

  context "#from_scalar_and_uom" do
    should "call the parser with the a scalar and uom in string" do
      mass = Unit.from_scalar_and_uom(5, "mg")

      assert_equal true, mass.mass?
      assert_equal 5, mass.scalar
      assert_equal "mg", mass.uom
    end
  end
end
