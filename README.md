# string_calculator

# String Calculator TDD  in Ruby

This project implements a string calculator in Ruby following Test-Driven Development (TDD) principles. It addresses all the requirements outlined in the Incubyte TDD.

## Project Structure



string-calculator-ruby/
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── string_calculator.rb              # The main implementation of the StringCalculator class.
├── spec/
│   └── string_calculator_spec.rb     # RSpec tests for the StringCalculator class.
└── test_string_calculator.rb        # (Optional) A standalone Ruby script for running tests.
└── README.md                         #This file, providing project information.

* `Gemfile`: Defines the project dependencies (RSpec).
* `Gemfile.lock`: Records the exact versions of the dependencies used.
* `README.md`: This file, providing an overview of the project.
* `spec/string_calculator_spec.rb`: Contains the RSpec test suite for the `StringCalculator` class.
* `string_calculator.rb`: Contains the implementation of the `StringCalculator` class.
* test_string_calculator.rb: script directly tests the StringCalculator class by running a series of predefined input strings and comparing the actual output 

The calculator's `add` method can handle the following:

* **Empty String:** Returns 0.
* **Single Number:** Returns the number itself.
* **Two Comma-Separated Numbers:** Returns their sum.
* **Any Amount of Comma-Separated Numbers:** Returns the sum of all numbers.
* **New Lines as Separators:** Allows `\n` as an alternative delimiter to commas.
* **Custom Single-Character Delimiters:** Supports custom single-character delimiters defined at the beginning of the string using the format `//[delimiter]\n[numbers]`. For example, `//;\n1;2` and `//%\n5%3` both work.
* **Negative Numbers:** Throws a `RuntimeError` with the message "negative numbers not allowed: \[list of negative numbers]" if negative numbers are present in the input.
* **Numbers Greater Than 1000:** Numbers greater than 1000 are ignored in the calculation.
* **Delimiters of Any Length:** Supports custom delimiters of any length using the format `//[[delimiter]]\n[numbers]`. For example, `//[***]\n1***2***3` should return 6.
* **Multiple Single-Character Delimiters:** Supports multiple single-character delimiters using the format `//[delim1][delim2]\n[numbers]`. For example, `//[*][%]\n1*2%3` should return 6.
* **Multiple Multi-Character Delimiters:** Supports multiple multi-character delimiters using the format `//[[delim1]][[delim2]]\n[numbers]`. For example, `//[**][%%]\n1**2%%3` should return 6.
* **Multiple Delimiters with Different Lengths:** Supports a combination of single and multi-character delimiters. For example, `//[*][%%]\n1*2%%3` should return 6.

## Getting Started

1.  **Clone the repository (if you have it in one):**
    ```bash
    git clone [repository URL]
    cd string-calculator-ruby
    ```

2.  **Alternatively, save the files:**
    Create the `string_calculator.rb` file and the `spec` directory with `string_calculator_spec.rb` inside it. You can also create the optional `test_calculator.rb` file.

3.  **Run the RSpec tests (recommended):**
    * Ensure you have RSpec installed (`gem install rspec`).
    * Navigate to the project root directory.
    * Run the tests:
        ```bash
        rspec spec/
        ```
        All 14 examples should pass.

4.  **Run the standalone test script (optional):**
    * Navigate to the project root directory.
    * Run the script:
        ```bash
        ruby test_calculator.rb
        ```
        All test cases should indicate "Test Passed".

## Usage

You can use the `StringCalculator` class in your Ruby projects:

```ruby
require_relative 'string_calculator'

calculator = StringCalculator.new

puts calculator.add("")             # Output: 0
puts calculator.add("5")            # Output: 5
puts calculator.add("1,5")          # Output: 6
puts calculator.add("1,2,3,4,5")    # Output: 15
puts calculator.add("1\n2,3")        # Output: 6
puts calculator.add("//;\n1;2")      # Output: 3
puts calculator.add("//%\n5%3")      # Output: 8

begin
  calculator.add("-1,2")
rescue RuntimeError => e
  puts e.message # Output: negative numbers not allowed: -1
end

puts calculator.add("1,1001,2")     # Output: 3
puts calculator.add("//[***]\n1***2***3") # Output: 6
puts calculator.add("//[*][%]\n1*2%3")   # Output: 6
puts calculator.add("//[**][%%]\n1**2%%3") # Output: 6
puts calculator.add("//[*][%%]\n1*2%%3")  # Output: 6






Possible Enhancements and Refactoring
Here are some potential ways to enhance or refactor the string_calculator.rb code:

Refactoring Ideas:

Extract Delimiter Parsing: The logic for handling custom delimiters (the if numbers.start_with?("//") block) could be extracted into a private helper method to improve the readability and maintainability of the add method. This has already been explored in the code and is a recommended refactoring.

Separate Number Parsing and Validation: The process of splitting the string into numbers, converting them to integers, and filtering those greater than 1000 could be moved into its own private method. This further separates concerns within the class.


Possible Enhancements:

Allowing Different Delimiter Markers: The current implementation uses // to indicate a custom delimiter. We could potentially allow other markers or more complex delimiter specifications.

Handling Different Error Types: Instead of always raising a generic RuntimeError for negative numbers, we could create a custom exception class specifically for this scenario.

More Sophisticated Error Reporting: When negative numbers are found, the error message could include the indices or positions of the negative numbers in the input string.

Support for More Complex Number Formats: The current implementation assumes simple integer numbers. We could potentially extend it to handle floating-point numbers or other formats.

Configuration Options: We could introduce configuration options to control whether negative numbers should throw errors or be ignored, or to specify default delimiters.