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

    ll.append("bop")
    assert_equal "bop", ll.head.next_node.next_node.data
    assert_nil ll.head.next_node.next_node.next_node

    ll.append("bebop")
    assert_equal "bebop", ll.head.next_node.next_node.next_node.data
    assert_nil ll.head.next_node.next_node.next_node.next_node

    ll.append("wham")
    assert_equal "wham", ll.head.next_node.next_node.next_node.next_node.data
    assert_nil ll.head.next_node.next_node.next_node.next_node.next_node
    assert_equal 5, ll.count
  end

  def test_to_string
    ll = LinkedList.new

    ll.append("doop")
    ll.append("deep")
    ll.append("bop")
    ll.append("bebop")
    ll.append("wham")

    assert_equal "doop deep bop bebop wham", ll.to_string
  end

  def test_prepend
    ll = LinkedList.new

    ll.append("plop")
    ll.append("suu")
    ll.prepend("dop")

    assert_equal "dop plop suu", ll.to_string
  end

  def test_insert
    ll = LinkedList.new

    ll.append("plop")
    assert_equal "plop", ll.to_string
    ll.append("suu")
    ll.prepend("dop")

    assert_equal "dop plop suu", ll.to_string
    assert_equal 3, ll.count
    ll.insert(1, "woo")
    assert_equal "dop woo plop suu", ll.to_string
    assert_equal 4, ll.count
  end

  def test_find
    skip
    ll = LinkedList.new

    ll.append("deep")
    ll.append("woo")
    ll.append("shi")
    ll.append("shu")
    ll.append("blop")
# binding.pry
    assert_equal "deep woo shi shu blop", ll.to_string
    assert_equal "shi", ll.find(2, 1)
    assert_equal "woo shi shu", ll.find(1, 3)
  end

  def test_includes?
    ll = LinkedList.new

    ll.append("deep")
    ll.append("woo")
    ll.append("shi")
    ll.append("shu")
    ll.append("blop")

    assert_equal 5, ll.node_data.length
    assert_equal true, ll.includes?("deep")
    assert_equal false, ll.includes?("dep")
  end

end
