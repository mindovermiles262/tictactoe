class Player
    attr_reader :name, :marker, :picked

    def initialize(name, marker)
        @name = name
        @marker = marker
        @picked = []
    end
    
end
