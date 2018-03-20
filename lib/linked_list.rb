require './lib/node'

class LinkedList
  attr_reader :head,
              :count
  def initialize
    @head = nil
    @count = 0
  end

  def append(data)
    @count += 1
    current_node = @head
    if @head.nil?
      @head = Node.new(data)
    else
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
    end
  end

  def to_string
    current = @head
    beats = "#{@head.data}"
    until current.next_node.nil?
      current = current.next_node
      beats << " #{current.data}"
    end
    beats
  end

  def prepend(data)
    @count += 1
    if @head.nil?
      @head = Node.new(data)
    else
      first_head = @head
      @head = Node.new(data)
      @head.next_node = first_head
    end
  end

  def insert(position, data)
    @count += 1
    count = 0
    current = @head
    if @head.nil?
      @head = Node.new(data)
    else
      until count == position - 1
        current = current.next_node
        count += 1
      end
    end
    new_node = Node.new(data)
    new_node.next_node = current.next_node
    current.next_node = new_node
  end
end
