require 'test_helper'

class ConcentrationTest < Minitest::Test
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

        assert_equal 5, new_con.calculated_scalar
        assert_equal 'mg/ml', new_con.calculated_uom
      end

      should "correctly add a smaller number" do
        denom1 = Unit::Volume.new(1, 'ml')
        denom2 = Unit::Volume.new(2, 'ml')
        con1 = Unit::Concentration.new(@num1, denom1)
        con2 = Unit::Concentration.new(@num2, denom2)

        new_con = con1 + con2

        assert_equal 3.5, new_con.calculated_scalar
        assert_equal 'mg/ml', new_con.calculated_uom
      end

      should "correctly add a larger number" do
        #Yes this seems like a duplicate, but I want to make sure the methods are associative
        denom1 = Unit::Volume.new(1, 'ml')
        denom2 = Unit::Volume.new(2, 'ml')
        con1 = Unit::Concentration.new(@num1, denom1)
        con2 = Unit::Concentration.new(@num2, denom2)

        new_con = con2 + con1

        assert_equal 3.5, new_con.calculated_scalar
        assert_equal 'mg/ml', new_con.calculated_uom
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

        assert_equal 1, diluted_con.calculated_scalar
        assert_equal "mg/ml", diluted_con.calculated_uom
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

        assert_equal 3, concentrate.calculated_scalar
        assert_equal "mg/ml", concentrate.calculated_uom
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

        assert_equal 1.5, new_con.calculated_scalar
        assert_equal "mg/ml", new_con.calculated_uom
      end
    end

    context "mass" do
      
      should "subtract correctly" do
        diluted_con = @con - @mass

        assert_equal 1.5, diluted_con.calculated_scalar
        assert_equal "mg/ml", diluted_con.calculated_uom
      end
    end

    context "volume" do
      should "subtract correctly" do
        small_vol = Unit::Volume.new(0.5, 'ml')
        concentrate = @con - small_vol

        assert_equal 4, concentrate.calculated_scalar
        assert_equal "mg/ml", concentrate.calculated_uom
      end
    end
  end
end
