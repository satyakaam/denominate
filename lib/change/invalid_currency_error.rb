class Change::InvalidCurrencyError < StandardError

  def initialize(msg = 'Invalid currency')
    super(msg)
  end
end