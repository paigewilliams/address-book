require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/address_book')
require('pry')

get('/')do
  erb(:index)
end

get('/contacts') do
  address_book = Address_Book.new()
  @names = []

  Address_Book.all.each do |contact|
    @names.push(contact.first_name)
  end

  erb(:display_contacts)
end

post('/contacts') do
  @first_name = params[:first_name]
  @last_name = params[:last_name]
  @contact_type = params[:contact_type].downcase
    if @contact_type == "business"
      erb(:business)
    else
      erb(:personal)
    end

end

post('/create/:contact_type') do
  address_book = Address_Book.new()
  attributes = {
    first_name: params[:first_name],
    last_name: params[:last_name]
  }

  if params[:contact_type] == "personal"
    address_book.make_personal(attributes)
  end

  @names = []

  Address_Book.all.each do |contact|
    @names.push(contact.first_name)
  end
  # binding.pry
  erb (:display_contacts)

end

 #
 # {"first_name"=>"John",
 # "last_name"=>"Henry",
 # "contact_type"=>"personal",
 # "email"=>"j@henry.com",
 # "street"=>"123",
 # "city"=>"Portland",
 # "state"=>"OR",
 # "zipcode"=>"97202"}


# params[:first_name]
