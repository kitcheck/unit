module Unit
  class Concentration

    attr_reader :numerator, :denominator, :numerator_components, :denominator_components, :calculated_scalar, :calculated_uom

    def initialize(numerator, denominator, numerator_components = [], denominator_components = [])
      @numerator = numerator#Top of line
      @denominator = denominator #Bottom of line
      @numerator_components = numerator_components
      @denominator_components = denominator_components
    end

    def +(other)
      if other.is_a? Concentration
        #if denominators are the same
        if denominator == other.denominator
        #Add numerators
          Concentration.new(numerator + other.numerator,
                            denominator,
                            numerator_components + other.numerator_components,
                            denominator_components + other.denominator_components
                           )
        else
        #else reduce to LCD
          if self.denominator < other.denominator
            reduced_other = other.reduce_to_lcd(self)
            Concentration.new(numerator + reduced_other.numerator,
                              denominator,
                              numerator_components + reduced_other.numerator_components,
                              denominator_components + other.denominator_components
                             )

          else
            reduced_self = reduce_to_lcd(other)
            Concentration.new(reduced_self.numerator + other.numerator,
                              reduced_self.denominator,
                              reduced_self.numerator_components + other.numerator_components,
                              reduced_self.denominator_components + other.denominator_components
                             )
          end
        end
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

    def reduce_to_lcd(lowest_concentration)

    end
  end
end
