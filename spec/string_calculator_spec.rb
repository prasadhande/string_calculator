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
  end
end