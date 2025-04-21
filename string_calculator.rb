# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      if parts.length > 1
        custom_delimiter = Regexp.escape(parts[0][2])
        delimiters << custom_delimiter
        numbers = parts[1]
      end
    end

    regex = Regexp.union(delimiters)
    number_array = numbers.split(regex).map(&:to_i)
    negatives = number_array.select { |num| num < 0 }

    if negatives.any?
      raise RuntimeError, "negative numbers not allowed: #{negatives.join(',')}"
    end

    number_array.sum
  end
end