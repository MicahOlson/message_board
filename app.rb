require('sinatra')
require('sinatra/reloader')
require('./lib/message')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @messages = Message.all
  erb(:messages)
end

get('/messages') do
  @messages = Message.all
  erb(:messages)
end

get('/messages/new') do
  erb(:new_message)
end

post('/messages') do
  user = params[:user]
  title = params[:title]
  user_post = params[:user_post]
  new_message = Message.new({:user => user, :title => title, :user_post => user_post, :id => nil})
  new_message.save()
  @messages = Message.all
  erb(:messages)
end

get('/messages/:id') do
  @messages = Message.find(params[:id].to_i())
  erb(:album)
end
