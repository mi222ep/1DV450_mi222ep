require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "save user with name and password" do
    u = User.new
    u.name = "testuser"
    u.password = "123456"
    assert u.save
  end
  test "Dont save without name"do
    u = User.new
    u.name = ""
    u.password ="123456"
    assert_not u.save
  end
end
