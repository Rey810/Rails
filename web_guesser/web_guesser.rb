require 'sinatra'
require 'sinatra/reloader'                  #allows file changes to reflect in browser without restarting server

number = rand(101)


get '/' do
    #throw params.inspect                    #a way to see what data looks like in the server
    guess = params["guess"].to_i
    cheat = params["cheat"]

    if cheat == 'true'
        cheat_number = "Nice... using cheats, huh? Here's the answer: #{number}"
    end

    if guess > (number + 5)
        guess_report = "Way too high!"
        colour = 'red'
        
    elsif guess < (number - 5)
        guess_report = "Way too Low!"
        colour = 'red'
    elsif guess < number
        guess_report = "Too Low!"
        colour = 'blue'
    elsif guess == number
        guess_report = "You guessed it right! The secret number is #{number}"
        colour = 'green'
    elsif guess > number
        guess_report = "Too High!"
        colour = 'blue'
    end
    erb :index, :locals => {:number => number, :guess_report => guess_report, :colour => colour, :cheat_number => cheat_number}
end