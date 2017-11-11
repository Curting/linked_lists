
class LinkedList

  def initialize(node = nil)
    @head = node
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      # Iterate from the @head to the last node with 'current' variable
      current = @head
      until current.next_node.nil?
        current = current.next_node
      end
      current.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current = @head
      @head = Node.new(value, current)
    end
  end


end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end