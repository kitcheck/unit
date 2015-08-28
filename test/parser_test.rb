require 'test_helper'

class ParserTest < Minitest::Test
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

  should "parse a volume" do
    vol = Unit::Parser.new("3 ml").parse

    assert_equal true, vol.volume?
    assert_equal 3.0, vol.scalar
    assert_equal "ml", vol.uom
  end

  should "parse a concentration" do


  end
end
