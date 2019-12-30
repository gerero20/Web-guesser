require 'sinatra'
require 'sinatra/reloader'


@@number = rand(100)
@@guesses_left = 5

def check_guess(guesser)
  case
  when $guess > @@number + 5
    ["Way too high!", "red"]
  when $guess > @@number 
    ["Too high!", "pink"]
  when $guess < @@number - 5
    ["Way too low!", "red"]
  when $guess < @@number
    ["Too low!", "pink"]
  else
    ["You got it right! The SECRET NUMBER is #{@@number} and ", "green"]
  end
end

def reset_checker()
  if @@guesses_left == 0
    @@guesses_left = 5
    @@number = rand(100)
  end
end

get '/' do
  $guess = params['guess'].to_i
  message = check_guess(@@number)[0]
  color = check_guess(@@number)[1]
  @@guesses_left -= 1
  reset_checker()
  erb :index, :locals => {:number => @@number, :message => message, :color => color, :guesses_left => @@guesses_left}
end
