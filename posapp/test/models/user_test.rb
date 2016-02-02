require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "save user with name and password" do
    u = User.new
    u.name = "testuser"
    u.password = "123456"
    u.save
  end
end
