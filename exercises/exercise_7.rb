require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts 'Exercise 7'
puts '----------'

puts "what's a name for a store?"
new_store_name = gets.chomp

@users_store = Store.create(
  name: new_store_name
)
# Your code goes here ...

@users_store.errors.full_messages.each do |message|
  puts message
end

# binding.pry
