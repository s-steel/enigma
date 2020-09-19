class Key
  def initialize
  end

  def random_five_digits
    5.times.map { rand 10 }
  end
  # ^^ returns array of digits

  def split_up_keys
    key_hash = {a: random_five_digits[0..1].join.to_i,
                b: random_five_digits[1..2].join.to_i,
                c: random_five_digits[2..3].join.to_i,
                d: random_five_digits[3..4].join.to_i}
  end
end
