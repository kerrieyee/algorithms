array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

class QuickFind
  def initialize(array)
    @array = array
  end

  def union(num1, num2)
    #N^2 time so much to slow
    if @array[num1] != @array[num2]
      @array.each_with_index do |e, i|
        if e == @array[num1]
          @array[i] = num2
        end
      end
    end
  end

  def connected(num1, num2)
    @array[num1] == @array[num2]
  end
end

q = QuickFind.new(array)
q.union(1, 2)
q.union(2, 4)
p q.connected(1, 4) #=> true