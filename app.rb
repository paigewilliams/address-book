require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/address_book')

get('/')do
 erb(:index)
end

get('/view') do
  @message = "test"
  erb(:input)
end

post('/view') do
  @message = "test"
  erb(:input)
end
