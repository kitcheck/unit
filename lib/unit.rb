require "unit/version"
require "unit/formatter"
require "unit/parser"
require "unit/unit"
require "unit/mass"
require "unit/volume"
require "unit/concentration"
require "unit/errors"
require "bigdecimal"


module Unit
  def self.parse(string)
    Parser.parse(string)
  end

  def self.from_object(object)
    determine_class(object.uom).new(object.scalar, object.uom, [object])
  end

  def self.from_scalar_and_uom(scalar, uom)
    determine_class(uom).new(scalar, uom)
  end

  private

  def self.determine_class(uom)
    if Mass.scale_hash.keys.include? uom
      Mass
    elsif Volume.scale_hash.keys.include? uom
      Volume
    elsif Unit.scale_hash.keys.include? uom
      Unit
    else
      raise IncompatibleUnitsError.new("This unit is incompatible")
    end
  end
end
