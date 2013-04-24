require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get ping" do
    get :ping
    assert_response :success
  end

end
