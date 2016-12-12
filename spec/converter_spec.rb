require "./converter.rb"


RSpec.describe Converter do
  converter = Converter.new

  context "[instantiation]" do
    it "creates instance of a class using new" do
      expect(converter).to be_an_instance_of(Converter)
    end

    describe "#initialize" do
      it "initialize roman_short_alphabet instance variable as a hash with keys: I,X,C,M and their values" do
        expect(converter.roman_short_alphabet).to eq({"I"=>1, "X"=>10, "C"=>100, "M"=>1000})
      end
    end
  end

  context "[instance methods]" do
    describe "#convert_to_roman_numerals" do
      it "returns a string as an answer" do
        expect(converter.convert_to_roman_numerals(123)).to be_a(String)
      end

      it "throws an error when passed anything but Fixnum" do
        expect(converter.convert_to_roman_numerals("123")).to eq("Wrong type of Argument error")
        expect(converter.convert_to_roman_numerals(true)).to eq("Wrong type of Argument error")
        expect(converter.convert_to_roman_numerals(123.5)).to eq("Wrong type of Argument error")
      end

      it "warns a user that 0 can't be converted to roman numeral" do
        expect(converter.convert_to_roman_numerals(0)).to eq("0 can not be converted")
      end

      it "returns a number converted to roman numerals" do
        expect(converter.convert_to_roman_numerals(1)).to eq("I")
        expect(converter.convert_to_roman_numerals(5)).to eq("V")
        expect(converter.convert_to_roman_numerals(10)).to eq("X")
        expect(converter.convert_to_roman_numerals(50)).to eq("L")
        expect(converter.convert_to_roman_numerals(100)).to eq("C")
        expect(converter.convert_to_roman_numerals(500)).to eq("D")
        expect(converter.convert_to_roman_numerals(1000)).to eq("M")

        expect(converter.convert_to_roman_numerals(4)).to eq("IV")
        expect(converter.convert_to_roman_numerals(9)).to eq("IX")
        expect(converter.convert_to_roman_numerals(40)).to eq("XL")
        expect(converter.convert_to_roman_numerals(90)).to eq("XC")
        expect(converter.convert_to_roman_numerals(400)).to eq("CD")
        expect(converter.convert_to_roman_numerals(900)).to eq("CM")

        expect(converter.convert_to_roman_numerals(-4)).to eq("-IV")
        expect(converter.convert_to_roman_numerals(-9)).to eq("-IX")
        expect(converter.convert_to_roman_numerals(-40)).to eq("-XL")
        expect(converter.convert_to_roman_numerals(-90)).to eq("-XC")
        expect(converter.convert_to_roman_numerals(-400)).to eq("-CD")
        expect(converter.convert_to_roman_numerals(-900)).to eq("-CM")

        expect(converter.convert_to_roman_numerals(1954)).to eq("MCMLIV")
        expect(converter.convert_to_roman_numerals(1990)).to eq("MCMXC")
        expect(converter.convert_to_roman_numerals(2014)).to eq("MMXIV")
      end

    end
  end
end
