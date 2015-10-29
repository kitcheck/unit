class Unit::Lexer
option
  ignorecase
macro
  BLANK       [\ \t]+
  SCALAR      [-+]?[0-9]*\.?[0-9]+
  MASS_UOM    \b(?:mcg|mg|g)\b
  VOLUME_UOM  \b(?:ml|l)\b
  UNIT_UOM    \b(?:unit|u)\b
  UNITLESS_UOM \b(?:ea)\b
  EQUIVALENCE_UOM      \b(?:meq|eq)\b
rule
  {BLANK}
  {SCALAR}      { [:SCALAR, BigDecimal.new(text, 10)] }

  #Mass
  \b(?:gm|gram)\b    { [:MASS_UOM, 'g'] }
  {MASS_UOM}    { [:MASS_UOM, text] }

  #Volume
  {VOLUME_UOM}  { [:VOLUME_UOM, text] }

  #Unit
  {UNIT_UOM}    { [:UNIT_UOM, text] }

  #Unitless uom
  {UNITLESS_UOM} {[:UNITLESS_UOM, text] }

  #Equivalence uom
  {EQUIVALENCE_UOM} {[:EQUIVALENCE_UOM, text] }

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
