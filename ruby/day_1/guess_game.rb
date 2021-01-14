print 'What is your name? '
player = gets.chomp

puts "Hello, #{player}!"
puts 'Let\'s play the guessing game!'

max_number = 10
random_number = rand(max_number + 1)
guesses = Array.new

print "Guess a number between 0 and #{max_number}: "

guess = gets.chomp.to_i
guesses.push(guess)
while guess != random_number
    if guess > random_number
        puts "#{guess} is too high..."
    elsif guess < random_number
        puts "#{guess} is too low..."
    end

    print 'Guess again: '
    guess = gets.chomp.to_i
    guesses.push(guess)
end

puts "You guessed correctly in #{guesses.count} tries!"
puts "Here's all your guesses: #{guesses}."
