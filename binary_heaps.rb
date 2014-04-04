class BinaryHeap
  attr_reader :array

  def initialize(array=[nil])
    @array = array
    @array = @array.unshift(nil) if array[0] != nil
  end

  def sort
    last_index = @array.length - 1
    (1..last_index).to_a.each do |e|
      swim(e)
    end
  end

  def heap_sort
    n = @array.length - 1
    k = n/2
    #heap construction
    while k >= 1
      sink(k, n)
      k -= 1
    end

    #sort down
    while (n > 1)
      exchange(1, n)
      n -= 1
      sink(1, n)
    end

  end

  def sink(index, n)
    while (2 * index) <= n
      child = 2 * index
      sibling = child + 1
      child += 1 if child < n &&  less(@array[child], @array[sibling])
      break if !less(@array[index], @array[child])
      exchange(index, child)
      index = child
    end
  end

  def swim(index)
    while index > 1 && less(@array[index/2], @array[index])
      exchange(index/2, index)
      index = index/2
    end
  end

  def insert(value)
    @array << value
    swim(@array.length - 1)
  end

  def less(val1, val2)
    val1 < val2
  end

  def exchange(index1, index2)
    node = @array[index1]
    child = @array[index2]
    @array[index1] = child
    @array[index2] = node
  end

  def delete_max
    last_index = @array.length - 1
    max = @array[1]
    exchange(1, last_index)
    sink(1, @array.length - 1)
    @array[last_index] = nil
    return max
  end
end

b = BinaryHeap.new([nil, "S", "O", "R", "T", "E", "X", "A", "M", "P", "L", "E"])
b.heap_sort
p b.array
# b.sort
# p b.array
# b.insert(2)
# b.insert(5)
# b.insert(1)
# b.insert(3)
# b.insert(20)
# b.insert(15)
# p b.array
# p b.delete_max
# p b.array

