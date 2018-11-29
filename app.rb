require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/address_book')
require('pry')

get('/')do
 erb(:index)
end

get('/contacts') do

  erb(:display_contacts)
end

post('/contacts') do

  @first_name = params.fetch("first_name")
  @last_name = params.fetch("last_name")
  @contact_type = params.fetch("contact_type").downcase
    if @contact_type == "business"
      erb(:business)
    else
      erb(:personal)
    end

end
