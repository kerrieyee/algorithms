class ThreeSum
  def initialize(array)
    @array = array
    @count = 0
    @triples = []
  end

  def find_triples
    @array.each_with_index do |e, i|
      num = i + 1
      @array[num..-1].each_with_index do |e, j|
        num2 = j + 1
        @array[num2.. -1].each_with_index do |e, k|
          if ((k + 2) < (@array.length - 1)) && (@array[i] + @array[j + 1] + @array[k + 1] == 0)
            three = [@array[i], @array[j + 1], @array[k  +1]].sort
            if !@triples.include?(three)
              @triples << three
              @count += 1
            end
          end
        end
      end
    end
  end
end

array = [30, -40, -20, -10, 40, 0, 10, 5]

three = ThreeSum.new(array)
three.find_triples
p three
#count should be 4
#triples shoudl be [[-40, 10, 30], [-20, -10, 30], [-40, 0, 40], [-20, -20, 40]]


