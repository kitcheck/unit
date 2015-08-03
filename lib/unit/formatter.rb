module Unit
  class Formatter
    def decimal_formatted(decimal)
      if decimal.present?
        "%g" % decimal
      end
    end

    def uom_formatted(uom)
      uom.downcase.gsub(/l$/, 'L')
    end
  end
end
