require 'test_helper'

class FerriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ferries_index_url
    assert_response :success
  end

  test "should get show" do
    get ferries_show_url
    assert_response :success
  end

end
