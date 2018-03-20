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
    if @head == nil
      @head = Node.new(data)
    else
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
    end
  end


end
