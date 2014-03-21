class SelectionSort
  #N^2/2 compares and N exchanges
  #quadratic time even if it's already sorted
  def initialize(array)
    @array = array
    @length = array.length
  end

  def sort
    @array.each_with_index do |e, i|
      min_index = i
      (i+1..@length - 1).to_a.each do |j|
        if less(@array[j], @array[min_index])
          min_index = j
        end
      end
      exchange(@array, i, min_index)
    end
  end

  def exchange(array, index, min_index)
    old = array[index]
    array[index] = array[min_index]
    array[min_index] = old
  end

  def less(val1, val2)
    val1 < val2
  end
end

s = SelectionSort.new([2,4,3,5,3,4,6,1,7])
p s.sort
