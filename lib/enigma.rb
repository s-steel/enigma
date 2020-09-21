require_relative 'shift'
require 'pry'

class Enigma
  attr_reader :message,
              :key,
              :date,
              :encryption,
              :decryption
  def initialize
    @key = Key.new.key
    @date = GenerateDate.new.date
    @encryption = Hash.new
    @decryption = Hash.new
  end

  def encrypt(message, key = @key, date = @date)
    @shift = Shift.new(message, key, date)
    key = @key if key.length != 5
    date = @date if date.length != 6
    @encryption[:encryption] = @shift.encrypt_message
    @encryption[:key] = key
    @encryption[:date] = date
    @encryption
  end

  def decrypt(message, key = @key, date = @date)
    @shift = Shift.new(message, key, date)
    key = @key if key.length != 5
    date = @date if date.length != 6
    @decryption[:decryption] = @shift.decrypt_message
    @decryption[:key] = key
    @decryption[:date] = date
    @decryption
  end
end
