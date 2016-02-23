#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.12
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require_relative 'lexer'

module Unit
  class Parser < Racc::Parser

module_eval(<<'...end parser_definition.y/module_eval...', 'parser_definition.y', 55)
  def parse(input)
    #Takes the results from the lexer's tokenize method and returns stuff
    @tokens = input
    do_parse
  end

  def next_token
    @tokens.shift
  end
...end parser_definition.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    25,    26,    27,    28,    30,    29,    24,    31,    35,    35,
    39,    41,    35,    35,    34,    37,    18,    22,    32,    21,
    23,    20,    19,    42,    43,    26,    44,    45,    46 ]

racc_action_check = [
    18,    18,    18,    18,    18,    18,    18,    18,    22,    23,
    22,    23,    20,    21,    20,    21,     0,    14,    19,    13,
    15,    11,     1,    24,    31,    35,    42,    44,    45 ]

racc_action_pointer = [
    14,    22,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    12,   nil,    10,     8,    11,   nil,   nil,    -3,    18,
    10,    11,     6,     7,    21,   nil,   nil,   nil,   nil,   nil,
   nil,    22,   nil,   nil,   nil,    21,   nil,   nil,   nil,   nil,
   nil,   nil,    23,   nil,    18,    24,   nil ]

racc_action_default = [
   -33,   -33,    -1,    -2,    -3,    -4,    -5,    -6,    -7,    -8,
    -9,   -10,   -11,   -12,   -13,   -14,   -15,   -16,   -33,   -33,
   -33,   -33,   -33,   -33,   -33,   -26,   -27,   -28,   -29,   -30,
   -31,   -33,    47,   -17,   -18,   -33,   -20,   -21,   -24,   -25,
   -22,   -23,   -33,   -32,   -33,   -33,   -19 ]

racc_goto_table = [
    12,     9,     3,     4,     5,     6,     7,     8,     2,    10,
    11,     1,    13,    14,    15,    16,    17,   nil,   nil,   nil,
    33,    36,    38,    40 ]

racc_goto_check = [
    12,     9,     3,     4,     5,     6,     7,     8,     2,    10,
    11,     1,    13,    14,    15,    16,    17,   nil,   nil,   nil,
    12,    12,    12,    12 ]

racc_goto_pointer = [
   nil,    11,     8,     2,     3,     4,     5,     6,     7,     1,
     9,    10,     0,    12,    13,    14,    15,    16 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  3, 13, :_reduce_17,
  3, 14, :_reduce_18,
  6, 21, :_reduce_19,
  3, 15, :_reduce_20,
  3, 16, :_reduce_21,
  3, 19, :_reduce_22,
  3, 20, :_reduce_23,
  3, 17, :_reduce_24,
  3, 18, :_reduce_25,
  2, 22, :_reduce_26,
  2, 23, :_reduce_27,
  2, 24, :_reduce_28,
  2, 25, :_reduce_29,
  2, 27, :_reduce_30,
  2, 26, :_reduce_31,
  3, 28, :_reduce_32 ]

racc_reduce_n = 33

racc_shift_n = 47

racc_token_table = {
  false => 0,
  :error => 1,
  :SCALAR => 2,
  :MASS_UOM => 3,
  :VOLUME_UOM => 4,
  :UNIT_UOM => 5,
  :UNITLESS_UOM => 6,
  :EQUIVALENCE_UOM => 7,
  :PERCENT => 8,
  :SLASH => 9,
  :COLON => 10 }

racc_nt_base = 11

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "SCALAR",
  "MASS_UOM",
  "VOLUME_UOM",
  "UNIT_UOM",
  "UNITLESS_UOM",
  "EQUIVALENCE_UOM",
  "PERCENT",
  "SLASH",
  "COLON",
  "$start",
  "valid_unit",
  "concentration",
  "concentration_no_denom_scalar",
  "unit_concentration",
  "unit_concentration_no_denom_scalar",
  "unit_less_concentration",
  "unit_less_concentration_no_denom_scalar",
  "equivalence_concentration",
  "equivalence_concentration_no_denom_scalar",
  "rational_concentration",
  "mass",
  "volume",
  "unit",
  "unitless",
  "equivalence",
  "percent",
  "solution" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

# reduce 16 omitted

module_eval(<<'.,.,', 'parser_definition.y', 21)
  def _reduce_17(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 22)
  def _reduce_18(val, _values, result)
     return Concentration.new(val[0], Volume.new(1, val[2])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 23)
  def _reduce_19(val, _values, result)
     return Concentration.new(Mass.new(val[0], val[3]), Volume.new(val[2], val[5])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 25)
  def _reduce_20(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 26)
  def _reduce_21(val, _values, result)
     return Concentration.new(val[0], Volume.new(1, val[2])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 28)
  def _reduce_22(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 29)
  def _reduce_23(val, _values, result)
     return Concentration.new(val[0], Volume.new(1, val[2])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 31)
  def _reduce_24(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 32)
  def _reduce_25(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 34)
  def _reduce_26(val, _values, result)
     return Mass.new(val[0], val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 36)
  def _reduce_27(val, _values, result)
     return Volume.new(val[0], val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 38)
  def _reduce_28(val, _values, result)
     return Unit.new(val[0], 'unit') 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 40)
  def _reduce_29(val, _values, result)
     return Unit.new(val[0], val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 42)
  def _reduce_30(val, _values, result)
     return Concentration.new(Mass.new(val[0] * 10, 'mg'), Volume.new(1, 'ml')) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 44)
  def _reduce_31(val, _values, result)
     return Equivalence.new(val[0], val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 46)
  def _reduce_32(val, _values, result)
     return Concentration.new(Mass.new(val[0] * 1000, 'mg'), Volume.new(val[2], 'ml')) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Unit
