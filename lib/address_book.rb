require_relative ('Business')
require_relative ('Personal')
require('pry')

class Address_Book
  @@db_contacts = []

  def self.all
    @@db_contacts
  end

  # def initialize
  #
  # end

  def self.sort(contact_type)
    results =[]
    @@db_contacts.each do |contact|
      if contact.class.to_s.include?(contact_type)
        results.push(contact)
      end
    end
    results
  end

  def make_personal(attributes)
    # attributes = {first_name: first_name, last_name:last_name}

    @@db_contacts.push(Personal::Contact.new(attributes))
  end


end
