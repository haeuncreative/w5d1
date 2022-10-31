class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    array_hash = Hash.new
    hash_num = 0
    # if self.empty?
    #   return Integer.hash
    # end
    self.each_with_index do |ele, i|
      array_hash[ele] = i
      hash_num += i * ele
    end
    hash_num
  end
end

class String
  def hash
    alph = ('a'..'z').to_a
    chars = self.split("")
    # char_hash = Hash.new
    hash_num = 0
    self.each_char.with_index do |char, i|
      # char_hash[char] = i
      hash_num += alph.index(char) * i
    end
    hash_num
    hash_num.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_num = 0
    self.each do |k, v|
      hash_num = k.length + v.size
      hash_num *= self.keys.index(k)
    end
    hash_num.hash
  end
end
