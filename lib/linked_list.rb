require './lib/node'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
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
      until current_node.next_node.nil?
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
    if @head.nil?
      @head = Node.new(data)
    else
      first_head = @head
      @head = Node.new(data)
      @head.next_node = first_head
    end
  end

  def insert(position, data)
    return "Nope" if position > count + 1
    current = @head
    if @head.nil?
      @head = Node.new(data)
    elsif
      (position - 1).times do
        current = current.next_node
      end
    end
    new_node = Node.new(data)
    new_node.next_node = current.next_node
    current.next_node = new_node
  end

  def includes?(phat_beat, current = @head)
    return "Nope" if @head.nil?
    if current.data == phat_beat
      true
    elsif current.next_node.nil?
      false
    else current = current.next_node
      includes?(phat_beat, current)
    end
  end

  def pop
    return "Nope" if @head.nil?
    if @head.next_node.nil?
      phat_beat = "#{@head.data}"
      @head = nil
      phat_beat
    else
      current = @head
      until current.next_node.next_node.nil?
        current = current.next_node
      end
    last_node_data = "#{current.next_node.data}"
    current.next_node = nil
    last_node_data
    end
  end
end
