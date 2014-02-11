class ThreeSum
  def initialize(array)
    @array = array.sort
    @count = 0
    @triples = []
  end

  def find_triples
    @array.each_with_index do |e, i|
      num = i + 1
      @array[num..-1].each_with_index do |d, j|
        sum = -(e + d)
        k = search(sum, j)
        if k != -1 && e < d && d < @array[k]
          @triples << [e, d, @array[k]]
          @count += 1
        end
      end
    end
  end

  def search(value, low_index)
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

array = [30, -40, -20, -10, 40, 0, 10, 5]
three = ThreeSum.new(array)
three.find_triples #[-40, 0, 40], [-40, 10, 30], [-20, -10, 30], [-10, 0, 10]
p three
