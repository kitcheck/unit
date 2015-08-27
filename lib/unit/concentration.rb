module Unit
  class Concentration

    attr_reader :numerator, :denominator, :numerator_components, :denominator_components, :calculated_scalar, :calculated_uom

    def initialize(numerator, denominator, numerator_components = [], denominator_components = [])
      @numerator = numerator#Top of line
      @denominator = denominator #Bottom of line
      @numerator_components = numerator_components
      @denominator_components = denominator_components

      if !numerator.is_a?(Mass) || !denominator.is_a?(Volume)
        raise "Don't be that guy"
      end
    end

    def +(other)
      if other.is_a? Concentration
        #Add numerators
        con1, con2 = Concentration.equivalise(self, other)
        Concentration.new(con1.numerator + con2.numerator,
                          con1.denominator, #This is the same for both cons because of the equivalise method
                          con1.numerator_components + con2.numerator_components,
                          con1.denominator_components + con2.denominator_components
                         )
      end
    end

    def -(other)
      if other.is_a? Concentration
      end
    end

    def *(other)
      if other.is_a? Concentration
        #multiply numerators
        #multiply denominators
      end
    end

    def <=>(other)
      con1, con2 = Concentration.equivalise(self, other)
      con1.calculated_scalar <=> con2.calculated_scalar
    end

    def calculated_scalar
      @numerator.scalar / @denominator.scalar
    end

    def calculated_uom
      @numerator.uom + "/" + @denominator.uom
    end

    def to_hash
      {
        :scalar => calculated_scalar,
        :uom => calculated_uom

      }
    end

    def to_formatted_hash
      to_hash.merge!({
        :scalar_formatted => Formatter.scalar_formatted(calculated_scalar),
        :uom_formatted => Formatter.uom_formatted(calculated_uom)
      })
    end

    private

    def self.equivalise(con1, con2)
      #if equivalent denoms, don't need to convert
      if con1.denominator == con2.denominator
        return con1, con2
      end
      #convert_denominator
      converted_denom1, converted_denom2 = Unit.equivalise(con1.denominator, con2.denominator)
      combined_denom = converted_denom1.class.new(converted_denom1.scalar * converted_denom2.scalar,
                                                  converted_denom1.uom,
                                                  converted_denom1.components + converted_denom2.components) #multiply denominators by each other
      #cross multiply
      scaled_num1 = con1.numerator.scale(converted_denom2.scalar)
      scaled_num2 = con2.numerator.scale(converted_denom1.scalar)
      new_con1 = Concentration.new(scaled_num1, combined_denom, con1.numerator_components, con1.denominator_components)
      new_con2 = Concentration.new(scaled_num2, combined_denom, con2.numerator_components, con2.denominator_components)

      return new_con1, new_con2
    end
  end
end
