require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'
require 'pry'

class LinkedListTest < Minitest::Test
  def test_it_exists
    ll = LinkedList.new

    assert_instance_of LinkedList, ll
  end

  def test_it_has_a_head_and_head_points_to_nil
    ll = LinkedList.new

    assert_nil ll.head
  end

  def test_it_can_append_multiple_nodes_to_the_list
    ll = LinkedList.new
    ll.append("doop")
    assert_equal "doop", ll.head.data
    assert_nil ll.head.next_node
    ll.append("deep")
    assert_equal "deep", ll.head.next_node.data
    assert_nil ll.head.next_node.next_node
  end

  def test_to_string
    ll = LinkedList.new
    ll.append("doop")
    ll.append("deep")
    assert_equal "doop", ll.to_string
  end
end
