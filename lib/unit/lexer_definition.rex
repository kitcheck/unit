class Unit::Lexer
option
  ignorecase
macro
  BLANK       [\ \t]+
  SCALAR      [-+]?[0-9]*\.?[0-9]+
  MASS_UOM    mcg|mg|g
  VOLUME_UOM  ml
  UNIT_UOM    unit
rule
  {BLANK}
  {SCALAR}      { [:SCALAR, BigDecimal.new(text, 10)] }

  #Mass
  {MASS_UOM}    { [:MASS_UOM, text] }
  gm            { [:MASS_UOM, 'g'] }

  #Volume
  {VOLUME_UOM}  { [:VOLUME_UOM, text] }

  #Unit
  {UNIT_UOM}    { [:UNIT_UOM, text] }

  #Concentration
  \/            { [:SLASH, text] }
  %             { [:PERCENT, text] }

inner
  def tokenize(code)
    scan_setup(code.downcase)
    @tokens = []
    while token = next_token
      @tokens << token
    end
    @tokens
  end
end
