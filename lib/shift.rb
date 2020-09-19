require_relative 'key'
require_relative 'offset'
require 'pry'

class Shift
  attr_reader :message, :key, :date
  def initialize(message,
                 key = Key.new.key,
                 date = Offset.new.offset)
    @message = message
    @key = key
    @date = date
    @characters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                   'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
                   'u', 'v', 'w', 'x', 'y', 'z', ' ']
  end

  def convert_date
    (@date.to_i ** 2).digits.reverse[-4..-1].join.to_s
  end

  def total_shift_amount
    shift_hash = {:a => @key[0..1].to_i + convert_date[0].to_i,
                  :b => @key[1..2].to_i + convert_date[1].to_i,
                  :c => @key[2..3].to_i + convert_date[2].to_i,
                  :d => @key[3..4].to_i + convert_date[3].to_i}
  end

  def shift_message
    array = []
    index = 0
    @message.downcase.each_char do |character|
      if index == 0
        array << a_shift(character)
      elsif index == 1
        array << b_shift(character)
      elsif index == 2
        array << c_shift(character)
      elsif index == 3
        array << d_shift(character)
      else
        character
      end
      index += 1
      index = 0 if index > 3
    end
    array.join
  end

  def a_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(total_shift_amount[:a]))]
    shift_hash[character]
  end

  def b_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(total_shift_amount[:b]))]
    shift_hash[character]
  end

  def c_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(total_shift_amount[:c]))]
    shift_hash[character]
  end

  def d_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(total_shift_amount[:d]))]
    shift_hash[character]
  end
end
