require 'test_helper'

class MeControllerTest < ActionController::TestCase
  test "should get events" do
    get :events
    assert_response :success
  end

end
