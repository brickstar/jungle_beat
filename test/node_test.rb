require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def test_it_exists
    assert_instance_of Node, Node.new("plop")
  end

  def test_it_has_data
    assert_equal "plop", Node.new("plop").data
  end
end
