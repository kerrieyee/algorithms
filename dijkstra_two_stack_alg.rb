class Evaluate
  def initialize(input)
    @val = Stack.new
    @operands = Stack.new
    eval(input)
    p @val.pop
  end

  def eval(input)
    input.split(" ").each do |e|
      if e == "("
      elsif e == "+" || e == "*"
        @operands.push(e)
      elsif e == ")"
        execute_operations
      else
        @val.push(e)
      end
    end
  end

  def execute_operations
    op = @operands.pop
    if op == "+"
      @val.push(@val.pop.to_i + @val.pop.to_i)
    elsif op == "*"
      @val.push(@val.pop.to_i * @val.pop.to_i)
    end
  end
end

class Stack
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

Evaluate.new("( 1 + ( ( 2 + 3 ) * ( 4 * 5 ) ) )")
