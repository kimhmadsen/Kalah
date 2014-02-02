Kalah
=====

Kalah is a Ruby based Kalah/Kalaha/Mancala engine. Useful for making intelligent game agents or interactive Kalah games. Flexible in terms of board structure.

# Installation
    gem install kalah

# Usage 
```
require 'kalah'

game = Kalah.new

while not game.has_current_player_won do
  puts game # Print game status
  puts "Current player: #{game.current_player}"
  puts "From which house do you want to sow?"
  begin
    sow gets.to_i # Sow house.
  rescue Kalah::IllegalMoveError => e
    puts e
  end
end
```
