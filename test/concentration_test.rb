require 'test_helper'

class ConcentrationTest < Minitest::Test
  context "initialization" do
    setup do
      @denom = Unit::Volume.new(1, 'ml')
    end
    should "allow mass in numerator" do
      num = Unit::Mass.new(5, 'mg')
      Unit::Concentration.new(num, @denom)
    end
    should "allow unit in numerator" do
      num = Unit::Unit.new(2, 'unit')
      Unit::Concentration.new(num, @denom)
    end

    should "blow up if denominator is not volume" do
      num = Unit::Mass.new(5, 'mg')
      denom = Unit::Unit.new(3, 'unit')

      assert_raises Unit::IncompatibleUnitsError do
        Unit::Concentration.new(num, denom)
      end
    end
  end
  context "equality" do
    context "equal" do
      setup do
        @num1 = Unit::Mass.new(2, 'mg')
        @num2 = Unit::Mass.new(2, 'mg')
        denom = Unit::Volume.new(1, 'ml')
        @con1 = Unit::Concentration.new(@num1, denom)
        @con2 = Unit::Concentration.new(@num2, denom)
      end

      should "be equal" do
        assert_equal @con1, @con2
      end
    end
  end
  context "addition" do
    context "adding concentration" do
      setup do
        @num1 = Unit::Mass.new(2, 'mg')
        @num2 = Unit::Mass.new(3, 'mg')
      end

      should "add two numbers with equivalent denominators" do
        denom = Unit::Volume.new(1, 'ml')
        con1 = Unit::Concentration.new(@num1, denom)
        con2 = Unit::Concentration.new(@num2, denom)

        new_con = con1 + con2

        assert_equal 5, new_con.scalar
        assert_equal 'mg/ml', new_con.uom
      end

      should "correctly add a smaller number" do
        denom1 = Unit::Volume.new(1, 'ml')
        denom2 = Unit::Volume.new(2, 'ml')
        con1 = Unit::Concentration.new(@num1, denom1)
        con2 = Unit::Concentration.new(@num2, denom2)

        new_con = con1 + con2

        assert_equal 3.5, new_con.scalar
        assert_equal 'mg/ml', new_con.uom
      end

      should "correctly add a larger number" do
        #Yes this seems like a duplicate, but I want to make sure the methods are associative
        denom1 = Unit::Volume.new(1, 'ml')
        denom2 = Unit::Volume.new(2, 'ml')
        con1 = Unit::Concentration.new(@num1, denom1)
        con2 = Unit::Concentration.new(@num2, denom2)

        new_con = con2 + con1

        assert_equal 3.5, new_con.scalar
        assert_equal 'mg/ml', new_con.uom
      end
    end

    context "diluting" do
      setup do
        num1 = Unit::Mass.new(2, 'mg')
        denom = Unit::Volume.new(1, 'ml')
        @con = Unit::Concentration.new(num1, denom)
      end

      should "return correctly" do
        diluted_con = @con + Unit::Volume.new(1, 'ml')

        assert_equal 1, diluted_con.scalar
        assert_equal "mg/ml", diluted_con.uom
      end
    end

    context "concentrating" do
      setup do
        num1 = Unit::Mass.new(2, 'mg')
        denom = Unit::Volume.new(1, 'ml')
        @con = Unit::Concentration.new(num1, denom)
      end

      should "return correctly" do
        concentrate = @con + Unit::Mass.new(1, 'mg')

        assert_equal 3, concentrate.scalar
        assert_equal "mg/ml", concentrate.uom
      end
    end
  end

  context "subtraction" do
    setup do
      num1 = Unit::Mass.new(2, 'mg')
      denom = Unit::Volume.new(1, 'ml')
      @con = Unit::Concentration.new(num1, denom)
      @mass = Unit::Mass.new(0.5, 'mg')
      @volume = Unit::Volume.new(1, 'ml')
    end

    context "concentration" do
      should "subtract correctly" do
        new_con = @con - Unit::Concentration.new(@mass, @volume)

        assert_equal 1.5, new_con.scalar
        assert_equal "mg/ml", new_con.uom
      end
    end

    context "mass" do
      should "subtract correctly" do
        diluted_con = @con - @mass

        assert_equal 1.5, diluted_con.scalar
        assert_equal "mg/ml", diluted_con.uom
      end
    end

    context "volume" do
      should "subtract correctly" do
        small_vol = Unit::Volume.new(0.5, 'ml')
        concentrate = @con - small_vol

        assert_equal 4, concentrate.scalar
        assert_equal "mg/ml", concentrate.uom
      end
    end
  end

  context "#mass_from_volume" do
    setup do
      num1 = Unit::Mass.new(2, 'mg')
      denom = Unit::Volume.new(1, 'ml')
      @con = Unit::Concentration.new(num1, denom)
    end

    should "correctly calculate" do
      mass = @con.mass_from_volume(Unit::Volume.new(2, 'ml'))
      assert_equal 4, mass.scalar
      assert_equal 'mg', mass.uom
    end
  end

  context "#volume_from_mass" do
    setup do
      num1 = Unit::Mass.new(2, 'mg')
      denom = Unit::Volume.new(1, 'ml')
      @con = Unit::Concentration.new(num1, denom)
    end

    should "correctly calculate" do
      vol = @con.volume_from_mass(Unit::Mass.new(0.5, 'mg'))

      assert_equal 0.25, vol.scalar
      assert_equal 'ml', vol.uom
    end
  end
end
