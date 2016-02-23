module Unit
  module Formatter
    def to_s
      "#{("%g" % scalar)} #{uom}"
    end

    def to_hash
      {
        :scalar => scalar,
        :uom => uom,
        :components => components
      }
    end

    def to_formatted_hash
      to_hash.merge!({
        :scalar_formatted => scalar_formatted(scalar),
        :uom_formatted => uom_formatted(uom)
      })
    end

    private

    def scalar_formatted(decimal)
      if !decimal.nil?
        "%g" % decimal
      end
    end

    def uom_formatted(uom)
      uom.downcase.gsub(/l$/, 'L')
    end
  end
end
