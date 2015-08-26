require 'test_helper'

class ConcentrationTest < Minitest::Test
  context "addition" do
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

end
