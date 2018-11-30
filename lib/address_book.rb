require_relative ('Business')
require_relative ('Personal')
require('pry')

class Address_Book
  @@db_contacts = []

  def self.all
    @@db_contacts
  end

  def self.find(id)
    @@db_contacts.each do |contact|
      if contact.contact_id == id.to_i
        return contact
      end
    end
  end

  def make_personal(attributes)
    contact_id = @@db_contacts.length + 1
    @@db_contacts.push(Personal::Contact.new(attributes, contact_id))
  end

  def make_business(attributes)
    contact_id = @@db_contacts.length + 1
    @@db_contacts.push(Business::Contact.new(attributes, contact_id))
  end

  def read_contact(id)
    @@db_contacts[id]
  end

end
