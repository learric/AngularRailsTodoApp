require 'test_helper'

class TodoTest < ActiveSupport::TestCase

  def setup
  	@todo = Todo.new(item: "This is a to do item")
  end

  test "should be present" do
  	assert @todo != ''
  end
end
