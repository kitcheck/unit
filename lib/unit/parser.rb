module Unit
  class Parser < StringScanner
    def parse
      ast = generate_ast
      interpret_ast(ast)
    end

    private

    def interpret_ast(ast)
      units = modify_nodes(ast)
      slash_index = units.index{|u| u.is_a?(String)&& u == "/"}
      if slash_index.nil?
        units.reduce(:+)
      else
        if units.size > 1 
          numerator = units[0...slash_index].reduce(:+)
          denom = units[slash_index+1..units.size].reduce(:+)
          Concentration.new(numerator, denom)
        else
          raise "Invalid string"
        end
      end
    end

    def modify_nodes(ast)
      ast.map do |node|
        scalar = scalar_regex.match(node).to_s
        if scalar.nil? #If we don't match a unit for the uom we will assume it's 1
          scalar = 1
        end
        uom = uom_regex.match(node).to_s
        determine_class(uom).new(scalar, uom)
      end
    end

    #Scans the string and pulls out scalars and strings
    def generate_ast
      ast = []
      while !eos?
        if scan(/\/{1}/) #Match slash
          ast << '/'
        elsif scan(unit_regex) #Should match a set of unit strings
          ast << matched
        else
          getch #Throw this index away because we don't match on it
        end
      end
      ast
    end

    def unit_regex
      Regexp.new(scalar_regex.to_s + /[[:space:]]*/.to_s + uom_regex.to_s)
    end

    def scalar_regex
      #\d Match a digit
      #\.{0,1} Match 0 or 1 decimal points
      #\d+ If there is a decimal point, match any digit after the decimal
      /[\d]*[\.{1}[\d+]]*/
    end

    def uom_regex
      /[[:alpha:]]+/
    end

    def determine_class(uom)
      if Mass.scale_hash.keys.include? uom
        Mass
      elsif Volume.scale_hash.keys.include? uom
        Volume
      elsif Unit.scale_hash.keys.include? uom
        Unit
      else
        raise IncompatibleUnitsError.new("This unit is incompatible")
      end
    end
  end
end
