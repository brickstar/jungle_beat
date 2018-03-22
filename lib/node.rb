class Node
  attr_reader :phat_beat
  attr_accessor :next_node
  def initialize(phat_beat)
    @phat_beat = phat_beat
    @next_node = nil
  end

end
