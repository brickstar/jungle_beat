require './lib/node'

class LinkedList
  attr_reader :head,
              :count,
              :node_data
  def initialize
    @head = nil
    @node_data = []
  end

  def count
    return 0 if @head.nil?
    current = @head
    counter = 1
    until current.next_node.nil?
      current = current.next_node
      counter += 1
    end
    counter
  end

  def append(data)
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

  def to_string(current = @head, length = count)
    return "Nope" if length > count
    phat_beats = "#{current.data}"
    (length - 1).times do
      current = current.next_node
      phat_beats << " #{current.data}"
    end
    phat_beats
  end

  def find(position, length)
    return "Nope" if position >= count
    current = @head
    position.times do
      current = current.next_node
    end
    to_string(current, length)
  end


  def prepend(data)
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
    @node_data << data
    counter = 0
    current = @head
    if @head.nil?
      @head = Node.new(data)
    elsif
      until counter == position - 1
        current = current.next_node
        counter += 1
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
