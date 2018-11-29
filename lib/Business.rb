module Business
  class Contact
    attr_accessor(:name_first, :name_last, :address)

    def initialize(attributes)
      @name_first = attributes[:name_first]
      @name_last = attributes[:name_last]
      @address = attributes[:address]
    end
  end
end
