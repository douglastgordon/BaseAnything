require 'byebug'

class NumberSystem

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
    'to_binary' => 2,
    'to_ternary' => 3,
    'to_quaternary' => 4,
    'to_quinary' => 5,
    'to_senary' => 6,
    'to_heptary' => 7,
    'to_octal' => 8,
    'to_nonary' => 9,
    'to_decimal' => 10,
    'to_undecimal' => 11,
    'to_duodecimal' => 12,
    'to_tridecimal' => 13,
    'to_tetradecimal' => 14,
    'to_pentadecimal' => 15,
    'to_hexadecimal' => 16,
    'to_vigesimal' => 20,
    'to_hexavigesimal' => 24,
    'to_heptavigesimal' => 27,
    'to_trigesimal' => 30,
    'to_duotrigesimal' => 32,
    'to_hexatrigesimal' => 36
  }

  def initialize(arr)
    @correspondences = make_correspondance_hash(arr)
    @base = arr.length
  end

  def make_correspondance_hash(arr)
    hash = {}
    value = 0
    arr.each do |key|
      hash[key] = value
      value += 1
    end
    hash
  end

  def to_dec(num)
    decimal_value = 0
    multiplier = 1
    num.split("").reverse.each do |digit|
      decimal_value += @correspondences[digit] * multiplier
      multiplier *= @base
    end
    decimal_value
  end

  def to_base(num, base)
    num = to_dec(num)
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

  def method_missing(name, num)
    name = name.to_s
    if name[0..2] == "to_"
      base = find_base[name[3..-1]]
    end
    to_base(num, base)
  end

end

# arr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
arr2 = ['0', '1', '2', '3']
num_sys = NumberSystem.new(arr2)

# num_sys.to_dec('91')

p num_sys.to_base('11020', 10)
p num_sys.to_bin('123')
