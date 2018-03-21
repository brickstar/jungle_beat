require './lib/node'

class LinkedList
  attr_reader :head,
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

  def append(phat_beat)
    current_node = @head
    if @head.nil?
      @head = Node.new(phat_beat)
    else
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(phat_beat)
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
    return "Nope" if position > count
    current = @head
    position.times do
      current = current.next_node
    end
    to_string(current, length)
  end


  def prepend(phat_beat)
    @node_data << phat_beat
    if @head.nil?
      @head = Node.new(phat_beat)
    else
      first_head = @head
      @head = Node.new(phat_beat)
      @head.next_node = first_head
    end
  end

  def insert(position, phat_beat)
    @node_data << phat_beat
    counter = 0
    current = @head
    if @head.nil?
      @head = Node.new(phat_beat)
    elsif
      until counter == position - 1
        current = current.next_node
        counter += 1
      end
    end
    new_node = Node.new(phat_beat)
    new_node.next_node = current.next_node
    current.next_node = new_node
  end



  def includes?(phat_beat, current)
    #current = head
    #if current.data == thing true
    #elsif current.next.nil? false
    #else current = current.next
    #includes?(phat_beat, current.next.thing)
    #else
    #current = current.next
    #end
  end


end
