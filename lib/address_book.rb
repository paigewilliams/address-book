require_relative ('Business')
require_relative ('Personal')
require('pry')

class Address_Book
  @@db_contacts = []

  def initialize()
    self.create_fred
    self.create_harry
  end

  def self.all
    @@db_contacts
  end

  def self.sort(contact_type)
    results =[]
    @@db_contacts.each do |contact|
      if contact.class.to_s.include?(contact_type)
        results.push(contact)
      end
    end
    results
  end

  def make_contact(attributes)
    @name_last
    @name_first
    @name_type
  end

   # def create_fred()
   #   @@db_contacts.push(Personal::Contact.new({name_first: 'Fred', name_last: 'Barry', address: 'Portland' }))
   # end
   #
   # def create_harry()
   #   @@db_contacts.push(Business::Contact.new({name_first: 'Harry', name_last: 'Potter', address: 'Portland' }))
   # end

end
