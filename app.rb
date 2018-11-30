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
  @contacts = []

  Address_Book.all.each do |contact|
    @contacts.push(contact)
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
  @contacts = []

  attributes = {
    contact_type: params[:contact_type],
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    street: params[:street],
    city: params[:city],
    state: params[:state],
    zip: params[:zip],
    job: params[:job],
    company: params[:company],
  }

  if params[:contact_type] == "personal"
    address_book.make_personal(attributes)
  elsif params[:contact_type] == "business"
    address_book.make_business(attributes)
  end

  Address_Book.all.each do |contact|
    @contacts.push(contact)
  end

  erb (:display_contacts)

end

get('/contacts/:user_id') do
  address_book = Address_Book.new()
  @contact = Address_Book.find(params[:user_id])

  erb(:display_individual_contact)
end
