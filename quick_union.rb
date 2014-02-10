#Quick Union
array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

class QuickUnion
  #linear time so still slow but fater than quick find
  def initialize(array)
    @array = array
  end

  def connected?(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    i = root(p)
    j = root(q)
    @array[i] = j
  end

  private

  def root(i)
    while i != @array[i] do
      i = @array[i]
    end
    i
  end
end
q = QuickUnion.new(array)
q.union(1,2)
q.union(2,4)
q.connected?(1,4)
