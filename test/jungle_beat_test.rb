require_relative "test_helper"
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

  def test_initialized_linked_list_head_starts_nil
    jb = JungleBeat.new

    assert_nil jb.list.head
  end

  def test_jungle_beat_appends_three_nodes
    jb = JungleBeat.new

    assert_equal "deep doo ditt", jb.append("deep doo ditt")
    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data
  end

  def test_jb_can_append_other_nodes
    jb = JungleBeat.new

    assert_equal "woo hoo shu", jb.append("woo hoo shu")
    assert_equal "woo", jb.list.head.data
    assert_equal "hoo", jb.list.head.next_node.data
  end

  def test_it_can_still_count
    jb = JungleBeat.new

    assert_equal "deep doo ditt", jb.append("deep doo ditt")
    assert_equal "woo hoo shu", jb.append("woo hoo shu")
    assert_equal 6, jb.list.count
    assert_equal 6, jb.count
  end

  def test_jb_can_play_beats
    jb = JungleBeat.new

    jb.append("deep doo ditt woo hoo shu")
    assert_equal "deep doo ditt woo hoo shu", jb.append("deep doo ditt woo hoo shu")
    jb.play
  end
end
