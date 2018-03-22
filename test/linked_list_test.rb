require_relative "test_helper"
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

  def test_it_can_count_nodes
    ll = LinkedList.new

    ll.append("deep")
    ll.append("woo")
    ll.append("shi")
    ll.append("shu")
    ll.append("blop")
    ll.prepend("shoop")
    ll.append("doobie")
    ll.insert(2, "bebop")
    ll.append("blah")
    ll.append("dingle")

    assert_equal 10, ll.count
  end

  def test_it_can_append_to_empty_list
    ll = LinkedList.new

    assert_nil ll.head

    ll.append("bebop")

    assert_equal "bebop", ll.head.phat_beat
  end

  def test_it_can_append_multiple_nodes_to_the_list
    ll = LinkedList.new

    ll.append("doop")
    assert_equal "doop", ll.head.phat_beat
    assert_nil ll.head.next_node

    ll.append("deep")
    assert_equal "deep", ll.head.next_node.phat_beat
    assert_nil ll.head.next_node.next_node

    ll.append("bop")
    assert_equal "bop", ll.head.next_node.next_node.phat_beat
    assert_nil ll.head.next_node.next_node.next_node

    ll.append("bebop")
    assert_equal "bebop", ll.head.next_node.next_node.next_node.phat_beat
    assert_nil ll.head.next_node.next_node.next_node.next_node

    ll.append("wham")
    assert_equal "wham", ll.head.next_node.next_node.next_node.next_node.phat_beat
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

  def test_it_can_prepend
    ll = LinkedList.new

    ll.append("plop")
    ll.append("suu")
    ll.prepend("dop")

    assert_equal "dop plop suu", ll.to_string
  end

  def test_it_can_prepend_an_empty_list
    ll = LinkedList.new

    assert_nil ll.head

    ll.prepend("beep")

    assert_equal 1, ll.count
  end

  def test_it_can_insert_nodes_at_specified_positions
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

    ll.append("beebop")
    ll.append("bop")
    ll.append("Miles Davis")
    assert_equal 7, ll.count

    ll.insert(6, "Coltrane")
    assert_equal "dop woo plop suu beebop bop Coltrane Miles Davis", ll.to_string
  end

  def test_it_cannot_insert_beyond_length_of_list
    ll = LinkedList.new

    ll.append("plop")
    ll.append("suu")
    ll.prepend("dop")
    ll.insert(1, "woo")

    assert_equal "No phat beats", ll.insert(100, "bop")
    assert_equal "dop woo plop suu", ll.to_string
    assert_equal 4, ll.count
    ll.insert(3, "Coltrane")
    assert_equal "dop woo plop Coltrane suu", ll.to_string
    assert_equal "No phat beats", ll.insert(8, "dinble")
    assert_equal "dop woo plop Coltrane suu", ll.to_string
  end



  def test_it_can_find_nodes
    ll = LinkedList.new

    ll.append("deep")
    ll.append("woo")
    ll.append("shi")
    ll.append("shu")
    ll.append("blop")

    assert_equal "deep woo shi shu blop", ll.to_string
    assert_equal "shi", ll.find(2, 1)
    assert_equal "woo shi shu", ll.find(1, 3)
  end

  def test_find_multiple_nodes
    ll = LinkedList.new

    ll.append("deep")
    ll.append("woo")
    ll.append("shi")
    ll.append("shu")
    ll.append("blop")
    ll.prepend("shoop")
    ll.append("doobie")
    ll.insert(2, "bebop")
    ll.append("blah")
    ll.append("dingle")
    ll.append("phat")

    assert_equal "shoop deep bebop woo shi shu blop doobie blah dingle phat", ll.to_string
    assert_equal "shu blop doobie blah", ll.find(5, 4)
    assert_equal "woo shi shu blop doobie blah", ll.find(3, 6)

    assert_equal "No more phat beats", ll.find(12, 1)
    assert_equal "No more phat beats", ll.find(15, 15)
    assert_equal 11, ll.count
  end


  def test_it_includes_phat_beats?
    ll = LinkedList.new

    ll.append("deep")
    ll.append("woo")
    ll.append("shi")
    ll.append("shu")
    ll.append("blop")

    assert_equal 5, ll.count
    assert_equal true, ll.includes?("deep")
    assert_equal false, ll.includes?("dep")
  end

  def test_empty_list_does_not_include_anything
    ll = LinkedList.new

    assert_nil ll.head
    assert_equal "No phat beats", ll.includes?("bebop")
  end

  def test_it_can_pop
    ll = LinkedList.new

    ll.append("deep")
    ll.append("woo")
    ll.append("shi")
    ll.append("shu")
    ll.append("blop")

    assert_equal 5, ll.count
    assert_equal "blop", ll.pop
    assert_equal 4, ll.count
    assert_equal "shu", ll.pop
    assert_equal 3, ll.count
    assert_equal "deep woo shi", ll.to_string
  end

  def test_it_cannot_pop_more_nodes_than_in_list
    ll = LinkedList.new

    ll.append("deep")
    ll.append("woo")
    ll.append("shi")
    ll.append("shu")
    ll.append("blop")

    assert_equal 5, ll.count
    assert_equal "blop", ll.pop
    assert_equal 4, ll.count
    assert_equal "shu", ll.pop
    assert_equal 3, ll.count
    assert_equal "deep woo shi", ll.to_string
    assert_equal "shi", ll.pop
    assert_equal 2, ll.count
    assert_equal "woo", ll.pop
    assert_equal 1, ll.count
    assert_equal "deep", ll.pop
    assert_equal 0, ll.count
    assert_equal "No more phat beats", ll.pop
    assert_equal "No more phat beats", ll.pop
    assert_equal "No more phat beats", ll.pop
    assert_nil ll.head
  end
end
