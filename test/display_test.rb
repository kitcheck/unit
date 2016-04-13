require 'test_helper'

class DisplayTest < Minitest::Test
  context "#to_s" do
    [
      [Unit.parse('5 mg'), "5 mg"],
      [Unit.parse('5.5 mg'), "5.5 mg"],
      [Unit.parse('5 ml'), "5 ml"],
      [Unit.parse('5 unit'), "5 unit"],
      [Unit.parse('5 mg/ml'), "5 mg/ml"],
      [Unit.parse('5 meq'), "5 meq"]
    ].each do |unit, expected|
      should "translate a unit with scalar #{unit.scalar} and uom #{unit.uom} to #{expected}" do
        assert_equal unit.to_s, expected
      end
    end
  end

  context "#to_hash" do
    [
      [Unit.parse('5 mg'), {:scalar => 5, :uom => 'mg', :components => []}],
      [Unit.parse('5 ml'), {:scalar => 5, :uom => 'ml', :components => []}],
      [Unit.parse('5 unit'), {:scalar => 5, :uom => 'unit', :components => []}],
      [Unit.parse('5 mg/ml'), {:scalar => 5, :uom => 'mg/ml', :components => []}],
      [Unit.parse('5 meq'), {:scalar => 5, :uom => 'meq', :components => []}]
    ].each do |unit, expected|
      should "translate a unit with scalar #{unit.scalar} and uom #{unit.uom} to #{expected}" do
        assert_equal unit.to_hash, expected
      end
    end
  end

  context "#to_formatted_hash" do
    [
      [Unit.parse('5 mg'), {:scalar => 5, :uom => 'mg', :components => [], :scalar_formatted => "5", :uom_formatted => "mg"}],
      [Unit.parse('5 ml'), {:scalar => 5, :uom => 'ml', :components => [], :scalar_formatted => "5", :uom_formatted => "mL"}],
      [Unit.parse('5 unit'), {:scalar => 5, :uom => 'unit', :components => [], :scalar_formatted => "5", :uom_formatted => "unit"}],
      [Unit.parse('5 mg/ml'), {:scalar => 5, :uom => 'mg/ml', :components => [], :scalar_formatted => "5", :uom_formatted => "mg/mL"}],
      [Unit.parse('5 meq'), {:scalar => 5, :uom => 'meq', :components => [], :scalar_formatted => "5", :uom_formatted => "meq"}]
    ].each do |unit, expected|
      should "translate a unit with scalar #{unit.scalar} and uom #{unit.uom} to #{expected}" do
        assert_equal unit.to_formatted_hash, expected
      end
    end

  end

  context "#inspect" do
    setup do
      @sut = Unit.parse('5 mg')
    end

    should 'look ok' do
      assert_equal '5 mg', @sut.inspect
    end
  end
end
