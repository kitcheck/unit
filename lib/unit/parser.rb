#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.12
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require_relative 'lexer'

module Unit
  class Parser < Racc::Parser

module_eval(<<'...end parser_definition.y/module_eval...', 'parser_definition.y', 52)
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
    24,    25,    26,    27,    29,    28,    23,    33,    33,    37,
    39,    33,    33,    35,    32,    17,    21,    30,    22,    20,
    19,    18,    40,    25,    41,    42,    43 ]

racc_action_check = [
    17,    17,    17,    17,    17,    17,    17,    21,    22,    21,
    22,    20,    19,    20,    19,     0,    14,    18,    15,    13,
    11,     1,    23,    33,    40,    41,    42 ]

racc_action_pointer = [
    13,    21,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    11,   nil,    10,     7,     9,   nil,    -3,    17,    10,
     9,     5,     6,    20,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    19,   nil,   nil,   nil,   nil,   nil,   nil,
    21,    16,    22,   nil ]

racc_action_default = [
   -31,   -31,    -1,    -2,    -3,    -4,    -5,    -6,    -7,    -8,
    -9,   -10,   -11,   -12,   -13,   -14,   -15,   -31,   -31,   -31,
   -31,   -31,   -31,   -31,   -25,   -26,   -27,   -28,   -29,   -30,
    44,   -16,   -17,   -31,   -19,   -20,   -23,   -24,   -21,   -22,
   -31,   -31,   -31,   -18 ]

racc_goto_table = [
    12,     9,     3,     4,     5,     6,     7,     8,     2,    10,
    11,     1,    13,    14,    15,    16,   nil,   nil,   nil,    31,
    34,    36,    38 ]

racc_goto_check = [
    12,     9,     3,     4,     5,     6,     7,     8,     2,    10,
    11,     1,    13,    14,    15,    16,   nil,   nil,   nil,    12,
    12,    12,    12 ]

racc_goto_pointer = [
   nil,    11,     8,     2,     3,     4,     5,     6,     7,     1,
     9,    10,     0,    12,    13,    14,    15 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  1, 11, :_reduce_none,
  3, 12, :_reduce_16,
  3, 13, :_reduce_17,
  6, 20, :_reduce_18,
  3, 14, :_reduce_19,
  3, 15, :_reduce_20,
  3, 18, :_reduce_21,
  3, 19, :_reduce_22,
  3, 16, :_reduce_23,
  3, 17, :_reduce_24,
  2, 21, :_reduce_25,
  2, 22, :_reduce_26,
  2, 23, :_reduce_27,
  2, 24, :_reduce_28,
  2, 26, :_reduce_29,
  2, 25, :_reduce_30 ]

racc_reduce_n = 31

racc_shift_n = 44

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
  :SLASH => 9 }

racc_nt_base = 10

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
  "percent" ]

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

module_eval(<<'.,.,', 'parser_definition.y', 20)
  def _reduce_16(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 21)
  def _reduce_17(val, _values, result)
     return Concentration.new(val[0], Volume.new(1, val[2])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 22)
  def _reduce_18(val, _values, result)
     return Concentration.new(Mass.new(val[0], val[3]), Volume.new(val[2], val[5])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 24)
  def _reduce_19(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 25)
  def _reduce_20(val, _values, result)
     return Concentration.new(val[0], Volume.new(1, val[2])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 27)
  def _reduce_21(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 28)
  def _reduce_22(val, _values, result)
     return Concentration.new(val[0], Volume.new(1, val[2])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 30)
  def _reduce_23(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 31)
  def _reduce_24(val, _values, result)
     return Concentration.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 33)
  def _reduce_25(val, _values, result)
     return Mass.new(val[0], val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 35)
  def _reduce_26(val, _values, result)
     return Volume.new(val[0], val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 37)
  def _reduce_27(val, _values, result)
     return Unit.new(val[0], 'unit') 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 39)
  def _reduce_28(val, _values, result)
     return Unit.new(val[0], val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 41)
  def _reduce_29(val, _values, result)
     return Concentration.new(Mass.new(val[0] * 10, 'mg'), Volume.new(1, 'ml')) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser_definition.y', 43)
  def _reduce_30(val, _values, result)
     return Equivalence.new(val[0], val[1]) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Unit
