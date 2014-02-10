array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

class QuickFind
  def initialize(array)
    @array = array
  end

  def union(num1, num2)
    #N^2 time so much to slow
    num1 = @array[num1]
    num2 = @array[num2]
    if num1 != num2
      @array.each_with_index do |e, i|
        if e == num1
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
q.union(9, 4)
q.union(6, 4)
q.union(2, 5)
q.union(5, 0)
q.union(4, 2)
q.union(2, 3)
#=> [3, 1, 3, 3, 3, 3, 3, 7, 8, 3]
