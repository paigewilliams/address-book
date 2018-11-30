module Business
  class Contact
    attr_reader(:first_name, :last_name, :contact_id, :email, :address, :job, :company, :contact_type)

    def initialize(attributes, id)
      @contact_id = id

      @contact_type = attributes[:contact_type]
      @first_name = attributes[:first_name]
      @last_name = attributes[:last_name]
      @email = attributes[:email]
      @job = attributes[:job]
      @company = attributes[:company]

      @address = {
        street: attributes[:street],
        city: attributes[:city],
        state: attributes[:state],
        zip: attributes[:zip]
      }
    end
  end
end
