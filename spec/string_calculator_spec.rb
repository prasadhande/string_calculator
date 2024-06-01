require_relative '../string_calculator'
  describe ".add" do
    context "when input is empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end


   context "when input has one number" do
      it "returns the number itself" do
        expect(StringCalculator.add("1")).to eq(1)
      end
    end

    context "when input has two numbers" do
      it "returns the sum of the numbers" do
        expect(StringCalculator.add("1,2")).to eq(3)
      end
    end

    context "when input has unknown amount of numbers" do
      it "returns the sum of all numbers" do
        expect(StringCalculator.add("1,2,3,4")).to eq(10)
      end
    end

    context "when input has new lines between numbers" do
      it "returns the sum of all numbers" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context "when input has different delimiters" do
      it "returns the sum of all numbers" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context "when input has negative numbers" do
      it "raises an exception with all negative numbers" do
        expect { StringCalculator.add("1,-2,-3") }.to raise_error("negatives not allowed: -2, -3")
      end
    end

    context "when input has numbers bigger than 1000" do
      it "ignores numbers bigger than 1000" do
        expect(StringCalculator.add("2,1001")).to eq(2)
      end
    end


To create a fully-fledged Ruby String Calculator with Test-Driven Development (TDD), we will follow these steps:

Write the minimal test for the simplest case.
Implement the simplest solution that makes the test pass.
Refactor if necessary.
Repeat for the next test case.
Step 1: Setup
First, ensure you have rspec installed. If not, install it using:

sh
Copy code
gem install rspec
Create a directory for your project and initialize rspec:

sh
Copy code
mkdir string_calculator
cd string_calculator
rspec --init
Step 2: Write Tests
Create a file named string_calculator_spec.rb inside the spec directory with the following initial tests:

ruby
Copy code
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    context "when input is empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "when input has one number" do
      it "returns the number itself" do
        expect(StringCalculator.add("1")).to eq(1)
      end
    end

    context "when input has two numbers" do
      it "returns the sum of the numbers" do
        expect(StringCalculator.add("1,2")).to eq(3)
      end
    end

    context "when input has unknown amount of numbers" do
      it "returns the sum of all numbers" do
        expect(StringCalculator.add("1,2,3,4")).to eq(10)
      end
    end

    context "when input has new lines between numbers" do
      it "returns the sum of all numbers" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context "when input has different delimiters" do
      it "returns the sum of all numbers" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context "when input has negative numbers" do
      it "raises an exception with all negative numbers" do
        expect { StringCalculator.add("1,-2,-3") }.to raise_error("negatives not allowed: -2, -3")
      end
    end

    context "when input has numbers bigger than 1000" do
      it "ignores numbers bigger than 1000" do
        expect(StringCalculator.add("2,1001")).to eq(2)
      end
    end

    context "when input has delimiters of any length" do
      it "returns the sum of all numbers" do
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context "when input has multiple delimiters" do
      it "returns the sum of all numbers" do
        expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end


    context "when input has multiple delimiters with length longer than one char" do
      it "returns the sum of all numbers" do
        expect(StringCalculator.add("//[***][%%%]\n1***2%%%3")).to eq(6)
      end
    end

  end
end