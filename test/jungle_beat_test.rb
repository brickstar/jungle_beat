require "./test/test_helper"
require './lib/linked_list'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_it_exists
    jb = JungleBeat.new

    assert_instance_of JungleBeat, jb
  end

  def test_it_initializes_with_a_new_linked_list_object
    jb = JungleBeat.new

    assert_instance_of LinkedList, jb.list
  end
end
