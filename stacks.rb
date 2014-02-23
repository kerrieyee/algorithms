class StackLinkedList
  attr_accessor :first
  def initialize
    @first = nil
  end

  def is_empty?
    @first == nil
  end

  def push(string)
    n = Node.new(string)
    old = @first
    @first = n
    @first.next = old unless is_empty?
  end

  def pop
    old = @first.string
    @first = @first.next
    old
  end
end

class Node
  attr_accessor :string, :next

  def initialize(string)
    @string = string
    @next = nil
  end
end

class StackArrayResize
  def initialize
    @array = [nil]
    @number_of_items = 0
  end

  def push(string)
    if @number_of_items == @array.length
      resize(2 * @array.length)
    end
    @array[@number_of_items] = string
    @number_of_items += 1
  end

  def resize(size)
    new_array = Array.new(size)
    @array.each_with_index do |e, i|
      new_array[i] = e unless e == nil
    end

    @array = new_array
  end

  def pop
    item  = @array[@number_of_items-1]
    return "nope" if @number_of_items == 0
    @number_of_items-=1
    @array[@number_of_items] = nil
    if @number_of_items > 0 && @number_of_items == @array.length/4
      resize(@array.length/2)
    end
    item
  end
end


l = StackLinkedList.new
l.push("to")
l.push("be")
l.push("or")
l.push("not")
l.push("to")
l.pop
l.push("be")
l.pop
l.pop
l.push("that")
l.pop
l.pop
l.pop
l.push("is")


# to be or not to - be - - that - - - is
#to be not that or be

# a = StackArrayResize.new
# a.push("to")
# a.push("be")
# a.push("or")
# a.push("not")
# a.push("to")
# p a.pop
# a.push("be")
# p a.pop
# p a.pop
# a.push("that")
# p a.pop
# p a.pop
# p a.pop
# a.push("is")

