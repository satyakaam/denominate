require './lib/change'
require './lib/change/input_validator'
require './lib/change/invalid_currency_error'
c = Change.new(Change.input)
puts "Enter an amount:"
amount = c.validator.validate(gets.chomp)
result = c.change_for(amount)
p result