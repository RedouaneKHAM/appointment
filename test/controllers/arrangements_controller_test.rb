require "test_helper"

class ArrangementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arrangements_index_url
    assert_response :success
  end

  test "should get new" do
    get arrangements_new_url
    assert_response :success
  end

  test "should get create" do
    get arrangements_create_url
    assert_response :success
  end
end
