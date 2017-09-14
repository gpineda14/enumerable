module Enumerable
  def my_each
    return self.to_enum unless block_given?
    for val in self
      yield val
    end
  end

  def my_each_with_index
    return self.to_enum unless block_given?
    size = self.length
    index = 0
    size.times {
      yield(self[index], index)
      index += 1
    }
  end

  def my_select
    return self.to_enum unless block_given?
    arr = []
    self.my_each { |val|
      arr << val if yield val
    }
    arr
  end

  def my_all?
    return self.to_enum unless block_given?
    self.my_each { |val|
      return false unless yield val
    }
    return true
  end

  def my_any?
    return self.to_enum unless block_given?
    self.my_each { |val|
      return true if yield val
    }
    return false
  end

  def my_none?
    return self.to_enum unless block_given?
    self.my_each { |val|
      return true unless yield val
    }
    return false
  end

  def my_count
    index = 0
    for val in self
      index += 1
    end
    index
  end

  def my_map(proc = Proc.new, &block)
    arr = []
    self.my_each { |val|
      arr << proc.call(val)
    }
    arr
  end

  def my_inject
    return self.to_enum unless block_given?
    accumulator = self[0]
    size = self.my_count
    index = 1
    (size - 1).times {
      accumulator = yield(accumulator, self[index])
      index += 1
    }
    accumulator
  end

end

def multiply_els(arr)
  arr.my_inject { |product, num| product * num }
end
