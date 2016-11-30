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
    num.split("").each do |digit|
      decimal_value += @correspondences[digit] * multipler
      multipler *= @base
    end
    decimal_value
  end


end
