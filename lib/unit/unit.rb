module Unit
  class Unit
    include Comparable

    attr_reader :scalar, :uom, :components

    def initialize(scalar, uom, components = [])
      @scalar = BigDecimal.new(scalar, 10)
      @uom = validate_uom(uom)
      @components = [components].compact.flatten
    end

    def self.from_object(object)
      self.new(object.scalar, object.uom, [object])
    end

    def self.from_scalar_and_uom(scalar, uom)
      self.new(scalar, uom)
    end

    def self.from_string(string)
      scalar, uom = string.split(" ")
      self.new(scalar, uom)
    end

    def self.scale_hash
      {}
    end

    def scale_hash
      Unit.scale_hash
    end

    def validate_uom(uom)
      if self.scale_hash.keys.include? uom
        uom
      else
        raise IncompatibleUnitsError.new("This unit is incompatible")
      end
    end

    def +(other)
      if @uom == other.uom
        self.class.new((scalar + other.scalar), @uom, @components + other.components)
      else
        if self < other
          scaled_other = other.convert_to(self.uom)
          byebug
          self.class.new((@scalar + scaled_other.scalar), scaled_other.uom, @components + other.components)
        else
          scaled_self = self.convert_to(other.uom)
          self.class.new((scaled_self.scalar + other.scalar), scaled_self.uom, @components + other.components)
        end
      end
    end

    def -(other)
      if @uom == other.uom
        self.class.new((@scalar - other.scalar), @uom, @components + other.components)
      else
        if self < other
          scaled_other = other.convert_to(self.uom)
          self.class.new((@scalar - scaled_other.scalar), scaled_other.uom, @components + other.components)
        else
          scaled_self = self.convert_to(other.uom)
          self.class.new((scaled_self.scalar - other.scalar), scaled_self.uom, @components + other.components)
        end
      end
    end

    def /(other)
      raise "Implement in subclasses"
    end

    alias_method :add, :+
    alias_method :subtract, :-
    alias_method :divide, :/

    def scale(scale)
      if scale.is_a? Float
        scale = BigDecimal.new(scale, 10)
      end
      self.class.new(@scalar * scale, @uom, @components)
    end

    def <=>(other)
      raise IncompatibleUnitsError.new("These units are incompatible") unless self.class == other.class
      comp_hash = self.scale_hash
      order_of_mag_comp = comp_hash[self.uom] <=> comp_hash[other.uom]
      if order_of_mag_comp == -1
        self <=> other.convert_to(self.uom)
      elsif order_of_mag_comp == 0
        self.scalar <=> other.scalar
      elsif order_of_mag_comp == 1
        self.convert_to(other.uom) <=> other
      end
    end

    def convert_to(uom)
      #Validate unit
      if self.uom == uom
        return self
      end
      destination_exp = self.scale_hash[uom]
      if destination_exp
        source_exp = self.scale_hash[@uom]
        #Get difference in exponents
        exp_diff = (destination_exp - source_exp).abs
        scaled_amount = @scalar * BigDecimal.new((10**exp_diff), 10)
        #Return new unit
        self.class.new(scaled_amount, uom, @components)
      else
        raise IncompatibleUnitsError.new("This unit is incompatible")
      end
    end

    def mass?
      Mass.scale_hash.keys.include? self.uom
    end

    def volume?
      Volume.scale_hash.keys.include? self.uom
    end

    def self.equivalise(u1, u2)
      raise IncompatibleUnitsError.new("These units are incompatible") unless u1.class == u2.class
      comp_hash = u1.scale_hash
      order_of_mag_comp = comp_hash[u1.uom] <=> comp_hash[u2.uom]
      if order_of_mag_comp == -1
        return u1, u2.convert_to(u2.uom)
      elsif order_of_mag_comp == 0
        return u1, u2
      elsif order_of_mag_comp == 1
        return u1.convert_to(u2.uom), u2
      end
    end

    #Display methods
    def to_s
      "#{@scalar.to_s("F")} #{@uom}"
    end

    def to_hash
      {
        :scalar => @scalar,
        :uom => @uom,
        :components => @components
      }
    end

    def to_formatted_hash
      to_hash.merge!({
        :scalar_formatted => Formatter.scalar_formatted(@scalar),
        :uom_formatted => Formatter.uom_formatted(@uom)
      })
    end
  end
end
