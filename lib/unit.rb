require "unit/version"
require "unit/formatter"
require "unit/parser"
require "unit/base"
require "unit/unit"
require "unit/mass"
require "unit/volume"
require "unit/concentration"
require "unit/errors"
require "bigdecimal"
require 'strscan'


module Unit
  def self.parse(string)
    tokens = Lexer.new.tokenize(string)
    Parser.new.parse(tokens)
  rescue
    raise IncompatibleUnitsError
  end
end
