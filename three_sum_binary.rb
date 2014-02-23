class ThreeSum
  def initialize(array)
    @array = array.sort
    @last_index = @array.length - 1
    @count = 0
    @triples = []
  end

  def find_triples

    @array[0..-3].each_with_index do |e, i|
      num = i + 1
      (num..@array.length - 1).to_a.each do |j|
        sum = @array[i] + @array[j]
        k = search(-sum, (j+1))
        if k != -1
          @triples << [e, @array[j], @array[k]]
          @count += 1
        end
      end
    end
  end

  def search(value, low_index)
    high_index = @array.length - 1
    low_index = low_index
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

array = [30, -40, -20, -10, 40, 0, 10, 5]
three = ThreeSum.new(array)
three.find_triples #[-40, 0, 40], [-40, 10, 30], [-20, -10, 30], [-10, 0, 10]
p three
