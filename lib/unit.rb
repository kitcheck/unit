require "unit/version"
require "unit/formatter"
require "unit/parser"
require "unit/unit"
require "unit/mass"
require "unit/volume"
require "unit/concentration"
require "unit/errors"
require "bigdecimal"
require 'strscan'


module Unit
  def self.parse(string)
    Parser.new(string).parse
  end
end
