require 'minitest/autorun'
require 'change'
require './lib/change/invalid_currency_error'
require './lib/change/input_validator'

class ChangeTest < Minitest::Test
  def setup
    @change1 = Change.new({quater: 25, dime: 10, nickel: 5, penny: 1})
    @change2 = Change.new({coin_of_fifty: 50, coin_of_fifteen: 15, coin_of_three: 3, penny: 1})
    @change_can_not_denominate = Change.new({five: 5, three: 3})
    @change_with_zero = Change.new({quater: 25, dime: 10, nickel: 5, penny: 0})
    @change_with_negative = Change.new({quater: 25, dime: 10, nickel: 5, penny: -1})
  end

  def test_change_coins
    assert_equal({quater: 1, dime: 1, nickel: 1, penny: 1},
      @change1.change_for(41))

    assert_equal({quater: 1},
      @change1.change_for(25))

    assert_equal({penny: 4},
      @change1.change_for(4))

    assert_equal({dime: 1, nickel: 1},
      @change1.change_for(15))

    assert_equal({coin_of_fifty: 24, coin_of_fifteen: 2, coin_of_three: 1, penny: 1},
      @change2.change_for(1234))
  end

  def test_denomination_failure
    assert_equal('Your currency can not denominate given amount',
      @change_can_not_denominate.change_for(2))

    assert_equal('Your currency can not denominate given amount',
      @change_can_not_denominate.change_for(9))
  end

  def test_currency_with_zero_coin
    assert_equal('Currency can not have zero value for any of the coins',
      @change_with_zero.change_for(41))
  end

  def test_currency_with_negative_value
    assert_equal('Currency can not have negative value for any of the coins',
      @change_with_negative.change_for(41))
  end
end
