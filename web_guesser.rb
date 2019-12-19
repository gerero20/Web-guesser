require 'sinatra'
require 'sinatra/reloader'

SECRET = rand(100)

get '/' do
  "The SECRET NUMBER is #{SECRET}"
end
