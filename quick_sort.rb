class QuickSort
  attr_reader :array
  def initialize(array)
    @array = array.shuffle
    @low =  @array[0]
    @low_index = 0
    @high_index = @array.length - 1
    @hi = @array[-1]
    @i = @low_index
    @j = @high_index + 1
  end

  def qsort
    partition
    insert_pointer
    sort(@low_index, @j - 1)
    sort(@j + 1, @high_index)
  end

  def partition
    while true
      while true
        @i += 1
        break if @array[@i] > @low
        break if @array[@i] == @hi
      end

      while true
        @j -= 1
        break if @array[@j] < @low
        break if @array[@j] == @low
      end

      break if @i > @j
      swap(@i, @j)
    end
  end

  def insert_pointer
    swap(@j, @low_index)
    @j
  end

  def swap(i, j)
    old_i = @array[i]
    @array[i] = @array[j]
    @array[j] = old_i
  end

  #methods taken from inerstion sort

  def sort(low_index, high_index)
    #modification to insertion sort to take a range
   (low_index..high_index).each_with_index do |e, i|
      (low_index..e).reverse_each do |j|
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

q = QuickSort.new(["d", "h", "g", "e", "f", "j", "b", "a", "i", "c"])
q.qsort
p q.array
