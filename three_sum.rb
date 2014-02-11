class ThreeSum
  def initialize(array)
    @array = array
    @count = 0
    @triples = []
  end

  def find_triples
    @array[0..-3].each_with_index do |e, i|
      num = i + 1
      array2 = @array[num..-2]
      array2.each_with_index do |d, j|
        num2 = j + 1
        array3 = array2[num2..-1]
        array3.each do |f|
          if e + d + f == 0
            three = [e, d, f].sort
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
#triples shoudl be [-40, 0, 40], [-40, 10, 30], [-20, -10, 30], [-10, 0, 10]


