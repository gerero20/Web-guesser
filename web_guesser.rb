require 'sinatra'
require 'sinatra/reloader'


$NUMBER = rand(100)
  

def check_guess(guesser)
  case
  when $guess > $NUMBER + 5
    "Way too high!" 
  when $guess > $NUMBER 
    "Too high!"
  when $guess < $NUMBER - 5
    "Way too low!"
  when $guess < $NUMBER
    "Too low!"
  else
    "You got it right! The SECRET NUMBER is #{$NUMBER} and "
  end
end

get '/' do
  $guess = params['guess'].to_i
  message = check_guess($NUMBER)
  erb :index, :locals => {:number => $NUMBER, :message => message}
end
