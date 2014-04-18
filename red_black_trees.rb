class Node
  attr_accessor :key, :value, :right, :left
  def initialize(key, value)
    @right = nil
    @left = nil
    @key = key
    @color = nil
  end

  def is_red?(node)
    return false if !node
    node.color == "red"
  end
end

class RedBlackTree
  def initialize(root=nil)
    @root = root
  end

  def rotate_left(node)
    x = node.right
    node.right = x.left
    x.left = node
    x.color = node.oclor
    node.color = "red"
    x
  end

  def put(key, value)
    @root = private_put(@root, key, value)
  end

  def private_put(node, key, value)
    x = node
    return Node.new(key, value) if !x
    if key < x.key
      x.left = private_put(x.left, key, value)
    elsif key > x.key
      x.right = private_put(x.right, key, value)
    else
      x.value = value
    end
    x
  end

  def get(key)
    x = @root
    while x != nil
      if key > x.key
        x = x.right
      elsif key < x.key
        x = x.left
      else
        x.val
      end
    end
  end
end
