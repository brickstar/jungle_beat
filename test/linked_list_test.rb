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

  def test_it_can_append_to_the_list
    ll = LinkedList.new

    assert_equal 'doop', ll.append("doop").data
    assert_nil node.next_node

  end

  def test_to_string
    ll = LinkedList.new
  end
end
