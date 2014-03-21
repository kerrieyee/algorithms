class InsertionSort
  #1/4(N^2) compares and 1/4(N^2) exchanges on avg
  #Best case N-1  compares and 0 exchanges
  #worst case 1/2(N^2) compares and 1/2(N^2) exchanges
  def initialize(array)
    @array = array
    @length = array.length
  end

  def sort
    @array.each_with_index do |e, i|
      (0..i).reverse_each do |j|
        if j != 0 && less(@array[j], @array[j-1])
          exchange(j, j-1)
        end
      end
    end
  end

  def exchange(current_index, previous_index)
    old_current = @array[current_index]
    old_previous = @array[previous_index]
    @array[current_index] = old_previous
    @array[previous_index] = old_current
  end

  def less(val1, val2)
    val1 < val2
  end
end

i = InsertionSort.new([2,4,3,5,3,4,6,1,7])
p i.sort
