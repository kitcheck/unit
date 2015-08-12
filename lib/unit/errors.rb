module Unit
  class IncompatibleUnitsError < StandardError
    super("This unit is incompatible")
  end
end
