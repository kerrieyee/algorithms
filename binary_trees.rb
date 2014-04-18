class Node
  attr_accessor :key, :value, :right, :left
  def initialize(key, value)
    @right = nil
    @left = nil
    @key = key
    @value = value
  end
end

class BinarySearchTree
  def initialize(root=nil)
    @root = root
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

  def floor(key)
    x = private_floor(@root, key)
  end

  def private_floor(node, key)
    return nil if !node
    return node if key == node.key
    return private_floor(node.left, key) if key < node.key
    t = private_floor(node.right, key)
    if t
      return t
    else
      return node
    end
  end
end

b = BinarySearchTree.new

b.put("s", 1)
b.put("e", 1)
b.put("a", 1)
b.put("r", 1)
b.put("c", 1)
b.put("h", 1)
b.put("x", 1)
b.put("m", 1)

p b
b.floor("g")


