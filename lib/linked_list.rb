require './lib/node'

class LinkedList
  attr_reader :head,
              :count,
              :node_data
  def initialize
    @head = nil
    @count = 0
    @node_data = []
  end

  def append(data)
    @node_data << data
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

  def to_string(current = @head, length = @count)
    phat_beats = "#{current.data}"
    (length - 1).times do
      current = current.next_node
      phat_beats << " #{current.data}"
    end
    phat_beats
  end

  def find(position, length)
    current = @head
    position.times do
      current = current.next_node
    end
    to_string(current, length)
  end


  def prepend(data)
    @count += 1
    @node_data << data
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
    @node_data << data
    count = 0
    current = @head
    if @head.nil?
      @head = Node.new(data)
    elsif
      until count == position - 1
        current = current.next_node
        count += 1
      end
    end
    new_node = Node.new(data)
    new_node.next_node = current.next_node
    current.next_node = new_node
  end


  def includes?(beat)
    @node_data.include?(beat)
  end


end
