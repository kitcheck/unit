module Unit
  class Concentration
    include Comparable

    attr_reader :numerator, :denominator, :scalar, :uom

    def initialize(numerator, denominator)
      @numerator = numerator#Top of line
      @denominator = denominator #Bottom of line

      if !(numerator.is_a?(Mass) || numerator.is_a?(Unit)) || !denominator.is_a?(Volume)
        raise IncompatibleUnitsError.new("The numerator must be a mass and the denominator must be a volume")
      end
    end

    def +(other)
      if other.is_a? Concentration
        #Add numerators
        con1, con2 = Concentration.equivalise(self, other)
        Concentration.new(con1.numerator + con2.numerator,
                          con1.denominator #This is the same for both cons because of the equivalise method
                         )
      elsif other.is_a? Mass
        Concentration.new(self.numerator + other, self.denominator)
      elsif other.is_a? Volume
        #Making the assumption that you're diluting
        Concentration.new(self.numerator, self.denominator + other)
      end
    end

    def -(other)
      if other.is_a? Concentration
        con1, con2 = Concentration.equivalise(self, other)
        Concentration.new(con1.numerator - con2.numerator,
                          con1.denominator #This is the same for both cons because of the equivalise method
                         )
      elsif other.is_a? Mass
        Concentration.new(self.numerator - other, self.denominator)
      elsif other.is_a? Volume
        #Making the assumption that you're diluting
        Concentration.new(self.numerator, self.denominator - other)
      end
    end

    def /(other)
      if other.concentration?
        con1, con2 = Concentration.equivalise(self, other)
        con1.scalar / con2.scalar
      else
        raise IncompatibleUnitsError
      end
    end

    def convert_to(uom)
      uoms = uom.split("/")
      if uoms.size  <= 1
        raise IncompatibleUnitsError
      end
      Concentration.new(numerator.convert_to(uoms[0]), denominator.convert_to(uoms[1]))
    end
    alias_method :>>, :convert_to

    def <=>(other)
      con1, con2 = Concentration.equivalise(self, other)
      con1.scalar <=> con2.scalar
    end

    def mass_from_volume(volume)
      raise ArgumentError.new("Argument must be a volume") unless volume.volume?
      volume = volume.convert_to(denominator.uom)
      numerator.class.new(scalar, numerator.uom).scale(volume.scalar)
    end

    def volume_from_mass(mass)
      raise ArgumentError.new("Argument must be a mass") unless mass.mass?
      mass = mass.convert_to(numerator.uom)
      denominator.scale(mass / numerator)
    end

    def scalar
      @numerator.scalar / @denominator.scalar
    end

    def uom
      @numerator.uom + "/" + @denominator.uom
    end

    def concentration?
      true
    end

    def to_s
      "#{scalar.to_s("F")} #{uom}"
    end

    def to_hash
      {
        :scalar => scalar,
        :uom => uom

      }
    end

    def to_formatted_hash
      to_hash.merge!({
        :scalar_formatted => Formatter.scalar_formatted(scalar),
        :uom_formatted => Formatter.uom_formatted(uom)
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
      new_con1 = Concentration.new(scaled_num1, combined_denom)
      new_con2 = Concentration.new(scaled_num2, combined_denom)

      return new_con1, new_con2
    end
  end
end
