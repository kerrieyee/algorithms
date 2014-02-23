class QueueLinkedList
  def initialize
    @list = []
    @first = nil
    @last = nil
  end

  def dequeue
    old = @first
    if is_empty?
      @last = nil
    else
      @first = @first.next
      @list.shift
    end
    old
  end

  def is_empty?
    @first == nil
  end

  def enqueue(string)
    old = @last
    @last = Node.new(string)
    if is_empty?
      @first = @last
    else
      old.next = @last
    end
    @list <<  @last
  end
end

class Node
  attr_accessor :string, :next

  def initialize(string)
    @string = string
    @next = nil
  end
end

q = QueueLinkedList.new
q.enqueue("hi")
q.enqueue("bob")
q.dequeue
q.enqueue("oranges")
p q
