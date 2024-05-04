class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end  
  end

  def size
    count = 0
    current_node = @head

    while current_node
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current_index = 0
    current_node = @head

    while current_index < index
      current_node = current_node.next_node
      current_index += 1
    end

    current_node
  end

  def pop
    return nil if @head == nil

    if @head == @tail
      popped_node = @head
      @head = nil
      @tail = nil
      return popped_node
    end

    current_node = @head
    while current_node.next_node != @tail
      current_node = current_node.next_node
    end

    popped_node = @tail
    @tail = current_node
    @tail.next_node = nil
    popped_node
  end

  def contains?(value)
    current_node = @head

    while current_node
      if current_node.value == value
        return true
      end
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    index = 0
    current_node = @head

    while current_node
      if current_node.value == value
        return index
      end
      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  def to_s
    current_node = @head
    result = ""
  
    while current_node
      result += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
  
    result += "nil"
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

end