require "unit/version"
require "unit/formatter"
require "unit/parser"
require "unit/base"
require "unit/unit"
require "unit/mass"
require "unit/volume"
require "unit/concentration"
require "unit/equivalence"
require "unit/errors"
require "bigdecimal"
require 'strscan'


module Unit
  def self.parse(string)
    #This is a magic gsub to turn separators into @ symbols.
    #This will break if you expect a negative number after the initial scalar
    #e.g. 1%-1:-1000
    string.gsub!(/(?!^)-/, '@')
    tokens = Lexer.new.tokenize(string)
    Parser.new.parse(tokens)
  rescue
    raise IncompatibleUnitsError.new("#{string} is not a valid unit string")
  end

  def self.from_scalar_and_uom(scalar, uom)
    self.parse("#{scalar} #{uom}")
  end
end
