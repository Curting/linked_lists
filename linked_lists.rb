
class LinkedList

  attr_reader :head

  def initialize
    @head = nil
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
    # If the list is empty return 0
    if @head.nil?
      size = 0
    else
      size = 1
      current = @head
      until current.next_node.nil?
        current = current.next_node
        size += 1
      end
    end
    size
  end

  def tail
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end
    current
  end

  def at(index)
    current = @head
    index.times do 
      current = current.next_node
    end
    current
  end

  def pop
    # If the list only contains one node... else...
    if @head.next_node.nil?
      @head.value = nil
    else
      current = @head
      # Assign current to second to last node
      until current.next_node.next_node.nil?
        current = current.next_node
      end
      # Assign the current tail to a variable to return it when popping
      current_tail = tail.clone

      # Assign second-to-last node as new tail
      current.next_node = nil

      current_tail
    end
  end

  def contains?(value)
    found = false
    current = @head
    # Does @head contain the value?
    found = true if current.value == value

    # If not, iterate through the list until found
    until found == true || current.next_node.nil?
      current = current.next_node
      found = true if current.value == value
    end
    found
  end

  def find(value)
    current = @head
    idx = 0
    found = false

    # Does @head contain the value?
    found = true if current.value == value

    # If not, iterate through the list until found
    until found || current.next_node.nil?
      current = current.next_node
      idx += 1
      found = true if current.value == value
    end

    found ? idx : nil
  end

  def to_s
    # Output the list in the format: "( data ) -> ( data ) -> ( data ) -> nil"
    string = ""

    current = @head

    until current.nil?
      string << "( #{current.value} ) -> "
      current = current.next_node
    end

    string << "nil"
  end

  def insert_at(value, index)
    current = @head
    prev_node = nil
    new_node = nil

    # If the index is 0 it should prepend the value.
    if index == 0
      self.prepend(value)
    else
      # If the list size is shorter (-1), equal (0) or longer (1) than index.
      # Remember self.size indexing starts from 1.
      case self.size <=> index
      when -1
        puts "ERROR: Too high index. The list is not that long."
      when 0
        # Index is the node after tail, so we can just append
        self.append(value)
      when 1
        index.times do
          prev_node = current
          current = current.next_node
        end

        # Let the new node point to the next node it's index-replacing
        new_node = Node.new(value, current)
        # Let the replaced node point to the new node
        prev_node.next_node = new_node
      end
    end
  end

  def remove_at(index)
    if self.size > index && index >= 0 
      current = @head
      prev_node = nil

      index.times do
        prev_node = current
        current = current.next_node
      end

      # Check if the list only contains one node:
      if prev_node.nil?
        @head = nil
      else
        # Example: Current = B: From A -> B -> C to A -> C
        prev_node.next_node = current.next_node
      end
      # Return the removed node
      current
    else
      puts "ERROR: Invalid index."
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

puts linked_list.head.value # => A

puts linked_list.tail.value # => D

puts linked_list.at(2).value # => C

puts linked_list.pop # => #<Node:0x007........>

puts linked_list.contains?("D") # => false
puts linked_list.contains?("A") # => true

puts linked_list.find("C") # => 2
puts linked_list.find("A") # => 0
puts linked_list.find("D").inspect # => nil

puts linked_list.to_s # => ( A ) -> ( B ) -> ( C ) -> nil

puts linked_list.insert_at("Q", 2) # => <Node:0x007...>
puts linked_list.to_s # => ( A ) -> ( B ) -> ( Q ) -> ( C ) -> nil

puts linked_list.remove_at(1) # => <Node:0x007...>
puts linked_list.to_s # => ( A ) -> ( Q ) -> ( C ) -> nil

# Does the #insert_at method work on an empty list? Yes.
new_list = LinkedList.new
puts new_list.insert_at("Q", 0)
puts new_list.to_s #=> ( Q ) -> nil

puts new_list.remove_at(0)
puts new_list.to_s #=> nil

