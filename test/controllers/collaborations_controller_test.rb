require 'test_helper'

class CollaborationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get collaborations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get collaborations_destroy_url
    assert_response :success
  end

end
