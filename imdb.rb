# SL10. More TDD (I mean, TV) series!
require 'sinatra'
require 'sinatra/reloader'
# require 'main.rb'

set :port, 3124
enable :sessions


get '/' do

  erb :index
end

post '/see_info' do
  "Hello World"
end





# post '/select_show' do

  

#   imdbstuff = ImdbStuff.new


#   redirect '/show_info'
#   erb :index
# end

# get '/show_info' do
# 	erb :index
# end




