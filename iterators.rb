require_relative 'stacks'

class Iterable
  def initialize(input)
    @iterator = Object.const_get("#{input.class}Iterator").new(input.first)
  end

  def has_next?
    @iterator.has_next?
  end

  def next
    @iterator.next
  end
end

class StackLinkedListIterator
  def initialize(first)
    @current = first
  end

  def has_next?
    @current != nil
  end

  def next
    item = @current.string
    @current = @current.next
    item
  end
end

l = StackLinkedList.new
l.push("to")
l.push("be")
l.push("or")
l.push("not")
l.push("to")
l.push("be")
l.push("that")
l.push("is")

i = Iterable.new(l)
i.has_next?
i.next.next.next  #=> "to"
