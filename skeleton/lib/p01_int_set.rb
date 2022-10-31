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
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if @store[num % @store.length].push(num)
      return true
    else
      return false
    end
  

  end

  def remove(num)
  end

  def include?(num)
    @store[num].include?(num)
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
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
