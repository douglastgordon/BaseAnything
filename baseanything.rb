require 'byebug'

class NumberSystem

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

    while (base ** highest_quot) <= num
      highest_quot += 1
    end

    while highest_quot >= 0
      next_digit = num / (base ** highest_quot)
      output << next_digit.to_s
      to_remove = next_digit * (base ** highest_quot)
      num -= to_remove
      highest_quot -= 1
    end

    output

  end

end

# arr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
arr2 = ['0', '1']
num_sys = NumberSystem.new(arr2)

# num_sys.to_dec('91')

p num_sys.to_base('1101', 10)
