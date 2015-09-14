module Unit
  class Mass < Base

    def /(other)
      if other.is_a? Mass
        if @uom == other.uom
          Mass.new((@scalar / other.scalar), @uom, @components + other.components)
        else
          u1, u2 = Mass.equivalise(self, other)
          Mass.new((u1.scalar / u2.scalar), u1.uom, u1.components + other.components)
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
  end
end
