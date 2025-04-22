require_relative 'string_calculator'

# Initialize the StringCalculator
calculator = StringCalculator.new

# Define test cases
test_cases = {
  "Empty string" => ["", 0],
  "Single number" => ["5", 5],
  "Two comma-separated numbers" => ["1,5", 6],
  "Multiple comma-separated numbers" => ["1,2,3,4,5", 15],
  "New line as separator" => ["1\n2,3", 6],
  "Custom single-character delimiter" => ["//;\n1;2", 3],
  "Custom another single-character delimiter" => ["//%\n5%3", 8],
  "Single negative number" => ["-1", "RuntimeError: negative numbers not allowed: -1"],
  "Multiple negative numbers" => ["2,-4,-5,6", "RuntimeError: negative numbers not allowed: -4,-5"],
  "Ignore numbers > 1000" => ["1,1001,2", 3],
  "Multiple single-character delimiters" => ["//[*][%]\n1*2%3", 6],
  "Custom delimiter of any length" => ["//[***]\n1***2***3", 6]
}

# Run test cases
test_cases.each do |description, (input, expected)|
  begin
    result = calculator.add(input)
    puts "#{description} - Input: #{input} - Expected: #{expected} - Got: #{result} - Test Passed: #{result == expected}"
  rescue => e
    puts "#{description} - Input: #{input} - Expected: #{expected} - Got: #{e.message} - Test Passed: #{e.message == expected}"
  end
end
