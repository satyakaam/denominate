class Change::InputValidator
  def validate(input)
    if input.to_i <= 0
      puts "Not allowed to enter anything but positive integer values"
      Change.new
    end
    input.to_i
  end
end
