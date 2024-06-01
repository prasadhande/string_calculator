# String Calculator
Overview
The String Calculator is a simple calculator that takes a string of numbers separated by delimiters and returns their sum. This project follows Test-Driven Development (TDD) principles to ensure robustness and correctness.

Features
Handles an empty string input.
Handles a single number input.
Handles two numbers input, separated by a comma.
Handles an unknown number of numbers.
Supports new lines as delimiters.
Supports custom delimiters specified in the input.
Raises an exception for negative numbers and lists all negatives in the exception message.
Ignores numbers larger than 1000.
Supports delimiters of any length.
Supports multiple custom delimiters.

Setup
Prerequisites
Ruby (version 2.5 or higher)
RSpec (version 3.0 or higher)
Installation
Ensure Ruby is installed on your machine. You can download Ruby from ruby-lang.org.

Install RSpec by running the following command:

gem install rspec



Project Structure

string_calculator/
├── .rspec
├── spec
│   ├── spec_helper.rb
│   └── string_calculator_spec.rb
└── string_calculator.rb


Files
string_calculator.rb: Contains the implementation of the String Calculator.
spec/string_calculator_spec.rb: Contains the tests for the String Calculator.


Usage
Running Tests
To run the tests, navigate to the project directory and execute:

rspec

This command will run all the tests in the spec directory and display the results.

Example Usage
The StringCalculator class provides a single class method add which takes a string of numbers and returns their sum.

require_relative 'string_calculator'

puts StringCalculator.add("")           # Output: 0
puts StringCalculator.add("1")          # Output: 1
puts StringCalculator.add("1,2")        # Output: 3
puts StringCalculator.add("1,2,3,4")    # Output: 10
puts StringCalculator.add("1\n2,3")     # Output: 6
puts StringCalculator.add("//;\n1;2")   # Output: 3

begin
  StringCalculator.add("1,-2,-3")
rescue => e
  puts e.message                       # Output: "negatives not allowed: -2, -3"
end

puts StringCalculator.add("2,1001")     # Output: 2
puts StringCalculator.add("//[***]\n1***2***3") # Output: 6
puts StringCalculator.add("//[*][%]\n1*2%3")    # Output: 6
puts StringCalculator.add("//[***][%%%]\n1***2%%%3") # Output: 6





