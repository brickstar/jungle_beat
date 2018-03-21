require './lib/linked_list'

class JungleBeat
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(phat_beats)
    to_append = phat_beats.split(" ")
    to_append.each do |beat|
      @list.append(beat)
    end
    phat_beats
  end

  def count
    return 0 if list.head.nil?
    current = list.head
    counter = 1
    until current.next_node.nil?
      current = current.next_node
      counter += 1
    end
    counter
  end

  def play
    phat_beats = ""
    current = list.head
    until current.next_node.nil?
      current = current.next_node
      phat_beats << current.data
    end
    `say -r 100  #{phat_beats}`
  end
end
