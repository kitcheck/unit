module Unit
  class Concentration

    attr_reader :numerator, :denominator, :components

    def initialize(numerator, denominator, components =[])
      @numerator = numerator#Top of line
      @denominator = denominator #Bottom of line
      @components = components
    end

    def +(other)
      if other.is_a? Concentration
        #if denominators are the same
        #Add numerators
        #else reduce to LCD
        #add numerators
      end
    end

    def -(other)
      if other.is_a? Concentration
        #if denominators are the same
        #subtract numerators
        #else reduce to LCD
        #subtract numerators
      end
    end

    def *(other)
      if other.is_a? Concentration
        #multiply numerators
        #multiply denominators
      end
    end

    def combined_scalar
      @numerator.scalar / @denominator.scalar
    end

    def combined_uom
      @numerator.uom + "/" + @denominator.uom
    end

    def to_hash
      {
        :scalar => combined_scalar,
        :uom => combined_uom

      }
    end

    def to_formatted_hash
      to_hash.merge!({
        :scalar_formatted => Formatter.scalar_formatted(combined_scalar),
        :uom_formatted => Formatter.uom_formatted(combined_uom)
      })
    end
  end
end
