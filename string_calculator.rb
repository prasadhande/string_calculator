# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    puts "Input numbers: #{numbers.inspect}" # Debug
    number_array = numbers.split(/[,\n]/)
    puts "Number array (strings): #{number_array.inspect}" # Debug
    int_array = number_array.map(&:to_i)
    puts "Integer array: #{int_array.inspect}" # Debug
    int_array.sum
  end
end