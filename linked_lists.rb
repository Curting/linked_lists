
class LinkedList

  attr_reader :head

  def initialize(node = nil)
    @head = Node.new(nil)
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

  def size
    size = 0
    current = @head
    until current.next_node.nil?
      current = current.next_node
      size += 1
    end
    size
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

linked_list = LinkedList.new
puts linked_list.size # => 0

linked_list.append("B")
puts linked_list.size # => 1

linked_list.append("C")
puts linked_list.size # => 2

linked_list.append("D")
puts linked_list.size # => 3

linked_list.prepend("A")
puts linked_list.size # => 4

puts linked_list.head # => #<Node:0x007.......>
puts linked_list.head.value # => A