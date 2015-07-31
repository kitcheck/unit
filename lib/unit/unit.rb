class Unit
  include Formatter

  attr_reader :scalar, :uom
  def initialize(scalar, uom)
    @scalar = BigDecimal.new(scalar)
    @uom = uom
  end

  def self.from_scalar_and_uom(scalar, uom)
    Unit.new(scalar, uom)
  end

  def self.from_string(string)
    scalar, uom = string.split(" ")
    Unit.new(scalar, uom)
  end

  def ==(other)
    @scalar == other.scalar && @uom == other.uom
  end

  def +(other)
    if @uom == other.uom
      Unit.new(@scalar + other.scalar, @uom)
    else
      #reduce units and add
    end
  end

  def -(other)
    if @uom == other.uom
      Unit.new(@scalar - other.scalar, @uom)
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
      :uom => @uom
    }
  end

  def to_formatted_hash
    to_hash.merge!({
      :scalar_formatted => decimal_formatted(@scalar),
      :uom_formatted => uom_formatted(@uom)
    })
  end
end
