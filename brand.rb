class Brand

    attr_reader :name, :address, :contact_number
    
    def initialize(name, address, contact_number)
        @name = name
        @address = address
        @contact_number = contact_number
        @ebikes = []
    end


end