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

    

  end
end