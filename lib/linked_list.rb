require './lib/node'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def count
    return 0 if @head.nil?
    current = @head
    phat_beats = 1
    until current.next_node.nil?
      current = current.next_node
      phat_beats += 1
    end
    phat_beats
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

  def to_string(current = @head, beat_count = count)
    return "No more phat beats" if beat_count > count
    phat_beats = "#{current.phat_beat}"
    (beat_count - 1).times do
      current = current.next_node
      phat_beats << " #{current.phat_beat}"
    end
    phat_beats
  end

  def find(position, beat_count)
    return "No more phat beats" if position > count
    current = @head
    position.times do
      current = current.next_node
    end
    to_string(current, beat_count)
  end

  def prepend(phat_beat)
    if @head.nil?
      @head = Node.new(phat_beat)
    else
      first_head = @head
      @head = Node.new(phat_beat)
      @head.next_node = first_head
    end
  end

  def insert(position, phat_beat)
    return "No phat beats" if position > count + 1
    current = @head
    if @head.nil?
      @head = Node.new(phat_beat)
    elsif
      (position - 1).times do
        current = current.next_node
      end
    end
    new_node = Node.new(phat_beat)
    new_node.next_node = current.next_node
    current.next_node = new_node
  end

  def includes?(phat_beat, current = @head)
    return "No phat beats" if @head.nil?
    if current.phat_beat == phat_beat
      true
    elsif current.next_node.nil?
      false
    else current = current.next_node
      includes?(phat_beat, current)
    end
  end

  def pop
    return "No more phat beats" if @head.nil?
    if @head.next_node.nil?
      phat_beat = "#{@head.phat_beat}"
      @head = nil
      phat_beat
    else
      current = @head
      until current.next_node.next_node.nil?
        current = current.next_node
      end
    last_node_phat_beat = "#{current.next_node.phat_beat}"
    current.next_node = nil
    last_node_phat_beat
    end
  end
end
