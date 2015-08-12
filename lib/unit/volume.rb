module Unit
  class Volume < Unit

    def self.scale_hash
      {
        'ml' => 0
      }
    end

    def scale_hash
      Volume.scale_hash
    end
  end
end
