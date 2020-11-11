require 'test_helper'

class InputTimesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get input_times_show_url
    assert_response :success
  end

  test "should get new" do
    get input_times_new_url
    assert_response :success
  end

  test "should get create" do
    get input_times_create_url
    assert_response :success
  end

end
