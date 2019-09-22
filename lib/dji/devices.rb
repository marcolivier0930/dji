
class Devices
    attr_accessor :device_name, :device_price

    @@all = []

    def initialize(attributes)
        @device_name = attributes[:name]
        @device_price = attributes[:price]
        @@all << self
    end

    def self.all
        @@all
    end
end