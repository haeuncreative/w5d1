require 'byebug'

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = (0..max)
    max_arr = @max.to_a
    @max_val = max_arr[-1]
    @store = Array.new(max, false)
  end

  def insert(num)
    if num < 0 || num > @max_val
      raise "Out of bounds"
    end
    # @store << num
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] == true
      return true
    else
      return false
    end
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    # debugger
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
    # @store.include?(num)
  end

  def remove(num)
    @store[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    index = num % @store.length
    # optional but useful; return the bucket corresponding to `num`
    @store[index]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
    # if @store.index(num) != 1
      self[num].push(num)
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    index = num % @store.length
    # optional but useful; return the bucket corresponding to `num`
    @store[index]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    og_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }
    flattened = og_store.flatten
    flattened.each do |ele|
      insert(ele)
    end 
    # if count > self.length

    #   # @store += Array.new(self.length)
    #   self.length * 2
    # end
  end
end
