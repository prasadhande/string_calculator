# string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      if parts.length > 1
        header = parts[0][2..]
        numbers = parts[1]
        if header.start_with?('[')
          header.scan(/\[(.*?)\]/).flatten.each do |delim|
            delimiters << Regexp.escape(delim)
          end
        else
          # Handle single-character delimiter(s)
          header.chars.each do |char|
            delimiters << Regexp.escape(char) unless char.empty?
          end
        end
      end
    end

    delimiters.uniq!
    regex_pattern = delimiters.join('|')
    number_array = numbers.split(Regexp.new(regex_pattern)).map(&:to_i).reject { |num| num > 1000 }
    negatives = number_array.select { |num| num < 0 }

    if negatives.any?
      raise RuntimeError, "RuntimeError: negative numbers not allowed: #{negatives.join(',')}"
    end

    number_array.sum
  end
end
=begin

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
      raise RuntimeError, "RuntimeError: negative numbers not allowed: #{negatives.join(',')}"
    end

    number_array.sum
  end
end

=end