require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  test "save application with all info" do
    a = Application.new
    a.name = "Testnamn"
    a.api_key = "12345"
    a.about = "Some basic facts about application"
    assert a.save
  end
  # test "the truth" do
  #   assert true
  # end
end
