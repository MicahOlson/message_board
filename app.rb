require('sinatra')
require('sinatra/reloader')
require('./lib/message')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @message = Message.all
  erb(:messages)
end

get('/messages') do
  @message = Message.all
  erb(:messages)
end

post('/messages') do
  user_name = params[:user]
  user_post = params[:user_post]
  new_message = Message.new({:user => user_name, :user_post => user_post, :post_id => nil})
  new_message.save()
  @messages = Message.all
  erb(:board)
end

get('/board') do
  @messages = Message.all
  erb(:board)
end