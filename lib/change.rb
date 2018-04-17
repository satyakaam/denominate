class Change
  def initialize(currency)
    @validator = InputValidator.new
    @currency = currency
  end

  def change_for(amount)
    begin
      Change.change_coins(amount, @currency, @currency.values.sort.reverse)
    rescue InvalidCurrencyError => e
      e.message
    rescue ZeroDivisionError => e
      "Currency can not have zero value for any of the coins"
    ensure
      "There is some issue..!! Please try again..!!"
    end
  end

  def validator
    @validator
  end

  def self.input
    values = Hash.new
    puts "How many coin values you want to enter?"
    validator = InputValidator.new
    coins = validator.validate(gets.chomp)
    coins.to_i.times do |v|
      puts "Enter name for coin #{v+1}:"
      name = gets.chomp
      puts "Enter value for coin #{v+1}:"
      values[name] = validator.validate(gets.chomp)
    end
    values
  end

  private 
  def self.change_coins(amount, currency, values, result = {})
    values = values.select { |value| value <= amount }
    unless values.empty? || amount == 0
      value = values.shift
      if value < 0
        raise InvalidCurrencyError.new("Currency can not have negative value for any of the coins")
      else
        result[currency.key(value)] = amount / value
        amount %= value
        change_coins(amount, currency, values, result)
      end
    end
    if values.empty? && amount != 0 
      raise InvalidCurrencyError.new("Your currency can not denominate given amount")
    else
      result
    end
  end
end