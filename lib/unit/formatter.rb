module Unit
  class Formatter
    def self.scalar_formatted(decimal)
      if !decimal.nil?
        "%g" % decimal
      end
    end

    def self.uom_formatted(uom)
      uom.downcase.gsub(/l$/, 'L')
    end
  end
end
