class Node
  attr_reader :data
  attr_accessor :next_node
  def initialize(phat_beat)
    @data = phat_beat
    @next_node = nil
  end

end
