class WeightedQuickUnion
  #find still takes time proportional to depth of p and q
  #but the depth of any node is at most lgN instead of N
  #union takes constant time pending on the roots

  # algorigthm  |initialize | union  | connected  | worst case time
  # quick-find  |    N      |   N    |    1       |     MN
  # quick-union |    N      |   N    |    N       |     MN
  # weighted qu |    N      |  lgN   |   lgN      |   N + M log N
  # qu + pc     |                                 |   N + M log N
  # wtdqu + pc  |                                 |   N + M lg* N

  #Note: M is the union-find operations on a set of N objects

  def initialize(size)
    n = size - 1
    @array = Array(0..n)
    @size = Array.new(size, 1)
  end

  def connected?(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    i = root(p)
    j = root(q)
    return if i == j

    if @size[i] < @size[j]
      @array[i] = j
      @size[j] += @size[i]
    else
      @array[j] = i
      @size[i] += @size[j]
    end
    @array
  end

  private

  def root(i)
    while i != @array[i] do
      #keeps tree flat if make node point to it's grandparent
      #known as path compresion
      @array[i] = @array[@array[i]]
      i = @array[i]
    end
    i
  end
end

q = WeightedQuickUnion.new(10)
q.union(0,5)
q.union(6,0)
q.union(9,2)
q.union(4,3)
q.union(3,2)
q.union(6,8)
q.union(8,9)
q.union(3,7)
q.union(0,5)
q.union(6,0)
q.union(1,2)

#without compression
# => [0, 0, 9, 4, 0, 0, 0, 0, 0, 4]

#with compression
# => [0, 0, 4, 0, 0, 0, 0, 0, 0, 4]
