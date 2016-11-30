module BaseAnything
  class NumberSystem

    def initialize(arr)
      @correspondences = make_correspondance_hash(arr)
      @base = arr.length
    end

    def to_base(num, base)
      num = own_to_dec(num)
      output = ""
      highest_quot = 0

      while (base ** (highest_quot+1)) <= num
        highest_quot += 1
      end

      while highest_quot >= 0
        next_digit = num / (base ** highest_quot)
        output << ANY_BASE[next_digit.to_s]
        to_remove = next_digit * (base ** highest_quot)
        num -= to_remove
        highest_quot -= 1
      end

      output
    end

    def from_base(num, base)
      num = other_to_dec(num, base)

      output = ""
      highest_quot = 0

      while (@base ** (highest_quot+1) <= num)
        highest_quot += 1
      end

      while highest_quot >= 0
        next_digit = num / (@base ** highest_quot)
        digit_value = @correspondences.select{|k,v| @correspondences[k.to_s] == next_digit}
        output << digit_value.keys[0]
        to_remove = next_digit * (@base ** highest_quot)
        num -= to_remove
        highest_quot -= 1
      end

      output

    end

    def method_missing(name, num)
      name = name.to_s
      if name[0..2] == "to_"
        base = FIND_BASE["#{name[3..-1]}"]
        to_base(num, base)
      elsif name[0..4] == "from_"
        base = FIND_BASE["#{name[5..-1]}"]
        from_base(num, base)
      end
    end

    private


      ANY_BASE = {
        '0' => '0',
        '1' => '1',
        '2' => '2',
        '3' => '3',
        '4' => '4',
        '5' => '5',
        '6' => '6',
        '7' => '7',
        '8' => '8',
        '9' => '9',
        '10' => 'A',
        '11' => 'B',
        '12' => 'C',
        '13' => 'D',
        '14' => 'E',
        '15' => 'F',
        '16' => 'G',
        '17' => 'H',
        '18' => 'I',
        '19' => 'J',
        '20' => 'K',
        '21' => 'L',
        '22' => 'M',
        '23' => 'N',
        '24' => 'O',
        '25' => 'P',
        '26' => 'Q',
        '27' => 'R',
        '28' => 'S',
        '29' => 'T',
        '30' => 'U',
        '31' => 'V',
        '32' => 'W',
        '33' => 'X',
        '34' => 'Y',
        '35' => 'Z'
      }

      FIND_BASE = {
        'binary' => 2,
        'ternary' => 3,
        'quaternary' => 4,
        'quinary' => 5,
        'senary' => 6,
        'heptary' => 7,
        'octal' => 8,
        'nonary' => 9,
        'decimal' => 10,
        'undecimal' => 11,
        'duodecimal' => 12,
        'tridecimal' => 13,
        'tetradecimal' => 14,
        'pentadecimal' => 15,
        'hexadecimal' => 16,
        'vigesimal' => 20,
        'hexavigesimal' => 24,
        'heptavigesimal' => 27,
        'trigesimal' => 30,
        'duotrigesimal' => 32,
        'hexatrigesimal' => 36
      }

    def make_correspondance_hash(arr)
      hash = {}
      value = 0
      arr.each do |key|
        hash[key] = value
        value += 1
      end
      hash
    end

    def own_to_dec(num)
      decimal_value = 0
      num.split("").reverse.each_with_index do |digit, i|
        decimal_value += @correspondences[digit] * (@base**i)
      end
      decimal_value
    end

    def other_to_dec(num, base)
      decimal_value = 0
      num.split("").reverse.each_with_index do |digit, i|
        digit_value = ANY_BASE.select{|k,v| ANY_BASE[k] == digit}
        digit_value = digit_value.keys[0].to_i
        decimal_value += digit_value * (base**i)
      end
      decimal_value
    end

  end
end
