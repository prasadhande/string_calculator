class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    delimiters = [",", "\n"]
    if input.start_with?("//")
      parts = input.split("\n", 2)
      delimiter_part = parts[0]
      numbers_part = parts[1]

      if delimiter_part[2] == "["
        delimiters = delimiter_part.scan(/\[(.*?)\]/).flatten
      else
        delimiters = [delimiter_part[2]]
      end
    else
      numbers_part = input
    end

    regex_pattern = Regexp.union(delimiters)
    numbers = numbers_part.split(regex_pattern).map(&:to_i)

    negatives = numbers.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(", ")}" if negatives.any?

    
  end
end
