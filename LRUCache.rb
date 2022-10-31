class LRUCache
    def initialize(num)
      @cache = Array.new(num)
      @size = num
        
    end

    def count
      @cache.size
      # returns number of elements currently in cache
    end

    def add(el)
      if @cache.include(el)
        @cache.delete(ele)
        @cache << el
      elsif @cache.count < @size
        @cache << el
      else
        @cache.shift
        @cache << el
      end
      # adds element to cache according to LRU principle
    end

    def show
      @cache
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

end


  p johnny_cache = LRUCache.new(4)

  p johnny_cache.add("I walk the line")
  p johnny_cache.add(5)

  p johnny_cache.count # => returns 2

  p johnny_cache.add([1,2,3])
  p johnny_cache.add(5)
  p johnny_cache.add(-5)
  p johnny_cache.add({a: 1, b: 2, c: 3})
  p johnny_cache.add([1,2,3,4])
  p johnny_cache.add("I walk the line")
  p johnny_cache.add(:ring_of_fire)
  p johnny_cache.add("I walk the line")
  p johnny_cache.add({a: 1, b: 2, c: 3})


  p johnny_cache.show