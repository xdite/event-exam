require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get title" do
    get :title
    assert_response :success
  end

  test "should get content" do
    get :content
    assert_response :success
  end

  test "should get person_limit" do
    get :person_limit
    assert_response :success
  end

  test "should get active_date" do
    get :active_date
    assert_response :success
  end

  test "should get price" do
    get :price
    assert_response :success
  end

end
