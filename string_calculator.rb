# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//[")
      match = numbers.match(/\/\/\[(.*?)\]\n(.*)/m)
      if match
        custom_delimiter = Regexp.escape(match[1])
        delimiters << custom_delimiter
        numbers = match[2]
      end
    elsif numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      if parts.length > 1
        custom_delimiter = Regexp.escape(parts[0][2])
        delimiters << custom_delimiter
        numbers = parts[1]
      end
    end

    # puts "Delimiters array: #{delimiters.inspect}" # Debug
    regex_pattern = delimiters.join('|')
    # puts "Regex pattern: #{regex_pattern.inspect}" # Debug
    number_array = numbers.split(Regexp.new(regex_pattern)).map(&:to_i).reject { |num| num > 1000 }
    negatives = number_array.select { |num| num < 0 }

    if negatives.any?
      raise RuntimeError, "negative numbers not allowed: #{negatives.join(',')}"
    end

    number_array.sum
  end
end