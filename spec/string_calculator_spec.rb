# spec/string_calculator_spec.rb
require_relative '../string_calculator' 

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number when a single number is passed' do
      calculator = StringCalculator.new
      expect(calculator.add('5')).to eq(5)
    end

    it 'returns the sum of two comma-separated numbers' do
      calculator = StringCalculator.new
      expect(calculator.add('1,5')).to eq(6)
    end

    it 'returns the sum of any amount of comma-separated numbers' do
      calculator = StringCalculator.new
      expect(calculator.add('1,2,3,4,5')).to eq(15)
    end

    it 'handles new lines as separators' do
      calculator = StringCalculator.new
      result = calculator.add("1\n2,3")
      puts "Actual result: #{result}" # Debugging output in test
      expect(result).to eq(6)
    end
    it 'supports a custom delimiter defined at the beginning of the string' do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'supports another custom delimiter' do
      calculator = StringCalculator.new
      expect(calculator.add("//%\n5%3")).to eq(8)
    end
  end
end