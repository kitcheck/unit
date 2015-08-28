module Unit
  class Mass < Unit

    def /(other)
      if other.is_a? Mass
        if @uom == other.uom
          Mass.new((@scalar / other.scalar), @uom, @components + other.components)
        else
          if self < other
            scaled_other = other.convert_to(self.uom)
            Mass.new((@scalar / scaled_other.scalar), scaled_other.uom, @components + other.components)
          else
            scaled_self = self.convert_to(other.uom)
            Mass.new((scaled_self.scalar / other.scalar), scaled_self.uom, @components + other.components)
          end
        end
      elsif other.is_a? Volume
        Concentration.new(self, other)
      else
        raise IncompatibleUnitsError.new("These units are incompatible (#{self.uom} and #{other.uom})")
      end
    end

    #Maps a unit of measure to it's power of 10 exponent, relative to mg
    def self.scale_hash
      {
        'mcg' => -3,
        'mg' => 0,
        'g' => 3
      }
    end

    def scale_hash
      Mass.scale_hash
    end
  end
end
