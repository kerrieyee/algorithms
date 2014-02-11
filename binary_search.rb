class BinarySearch
  def initialize(array)
    @array = array.sort
  end

  def search(value)
    high_index = @array.length - 1
    low_index = 0
    while low_index <= high_index
      mid_index = middle_index(low_index, high_index)
      if value > @array[mid_index]
        low_index = mid_index + 1
      elsif value < @array[mid_index]
        high_index = mid_index - 1
      else
        return mid_index
      end
    end
    -1
  end

  def middle_index(low_index, high_index)
    (high_index + low_index)/2
  end
end
array = [30, -40, -20, -10, 40, 0, 10, 5].sort

b = BinarySearch.new(array)
p b.search(10)
