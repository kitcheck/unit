module Unit
  class Mass < Unit
    #Maps a unit of measure to it's power of 10 exponent, relative to mg

    def self.scale_hash
      {
        'mg' => 0,
        'mcg' => 1,
        'g' => 3
      }
    end

    def scale_hash
      Mass.scale_hash
    end
  end
end
