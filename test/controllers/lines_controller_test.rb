require 'test_helper'

class LinesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get lines_edit_url
    assert_response :success
  end

  test "should get update" do
    get lines_update_url
    assert_response :success
  end

end
