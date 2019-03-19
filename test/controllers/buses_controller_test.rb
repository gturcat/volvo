require 'test_helper'

class BusesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get buses_new_url
    assert_response :success
  end

end
