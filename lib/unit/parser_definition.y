class Unit::Parser
token SCALAR MASS_UOM VOLUME_UOM UNIT_UOM PERCENT SLASH
rule
  valid_unit:
    concentration |
    concentration_no_denom_scalar |
    unit_concentration |
    unit_concentration_no_denom_scalar |
    mass |
    volume |
    unit |
    percent

  concentration : mass SLASH volume { return Concentration.new(val[0], val[2]) }
  concentration_no_denom_scalar : mass SLASH VOLUME_UOM { return Concentration.new(val[0], Volume.new(1, val[2])) }

  unit_concentration : unit SLASH volume { return Concentration.new(val[0], val[2]) }
  unit_concentration_no_denom_scalar : unit SLASH VOLUME_UOM { return Concentration.new(val[0], Volume.new(1, val[2])) }

  mass : SCALAR MASS_UOM { return Mass.new(val[0], val[1]) }

  volume : SCALAR VOLUME_UOM { return Volume.new(val[0], val[1]) }

  unit : SCALAR UNIT_UOM { return Unit.new(val[0], val[1]) }

  percent : SCALAR PERCENT { return Concentration.new(Mass.new(val[0] * 10, 'mg'), Volume.new(1, 'ml')) }

end

---- header
  require_relative 'lexer'

---- inner
  def parse(input)
    #Takes the results from the lexer's tokenize method and returns stuff
    @tokens = input
    do_parse
  end

  def next_token
    @tokens.shift
  end
