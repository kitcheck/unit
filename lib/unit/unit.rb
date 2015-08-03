class Unit
  include Formatter

  attr_reader :scalar, :uom
  def initialize(scalar:, uom:, components: [])
    @scalar = BigDecimal.new(scalar)
    @uom = uom
    @components = [components].compact.flatten
  end

  def self.from_object(object:)
    Unit.new(scalar: object.scalar, uom: object.uom, components: [object])
  end

  def self.from_scalar_and_uom(scalar, uom)
    Unit.new(scalar: scalar, uom: uom)
  end

  def self.from_string(string)
    scalar, uom = string.split(" ")
    Unit.new(scalar: scalar, uom: uom)
  end

  def ==(other)
    @scalar == other.scalar && @uom == other.uom
  end

  def +(other)
    if @uom == other.uom
      Unit.new(scalar:(@scalar + other.scalar), uom: @uom, components: @components + other.components)
    else
      #reduce units and add
    end
  end

  def -(other)
    if @uom == other.uom
      Unit.new(scalar:(@scalar - other.scalar), uom: @uom, components: @components + other.components)
    else
      #reduce units and subtract
    end
  end

  def reduce

  end

  #Display methods
  def to_hash
    {
      :scalar => @scalar,
      :uom => @uom,
      :components => @components
    }
  end

  def to_formatted_hash
    to_hash.merge!({
      :scalar_formatted => decimal_formatted(@scalar),
      :uom_formatted => uom_formatted(@uom)
    })
  end
end
