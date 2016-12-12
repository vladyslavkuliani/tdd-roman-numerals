# Roman Numeral Converter
# Converts integers to roman numeral strings

class Converter
  attr_reader :roman_short_alphabet

  def initialize
    @roman_short_alphabet = {
      "I"=>1, "X"=>10, "C"=>100, "M"=>1000
    }
  end

  def convert_to_roman_numerals(number)
    return "Wrong type of Argument error" unless number.is_a?(Fixnum) || number.is_a?(Bignum)
    return "0 can not be converted" unless number!=0
    str = []
    if number<0
      number *= -1
      negative=true
    end
    while number!=0 do
      str << "M" if number.to_s.size>=4
      str << "C" if number.to_s.size == 3
      str << "X" if number.to_s.size == 2
      str << "I" if number.to_s.size == 1
      number -= @roman_short_alphabet[str[-1]]
    end

    str = str.join()
    str.gsub!(/[I]{5}/, "V")
    str.gsub!(/[I]{4}/, "IV")
    str.gsub!(/VIV/, "IX")
    str.gsub!(/[X]{5}/, "L")
    str.gsub!(/[X]{4}/, "XL")
    str.gsub!(/LXL/, "XC")
    str.gsub!(/[C]{5}/, "D")
    str.gsub!(/[C]{4}/, "CD")
    str.gsub!(/DCD/, "CM")

    str.insert(0, "-") if negative
    str
    end
end
