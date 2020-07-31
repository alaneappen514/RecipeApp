require 'test_helper'

class RecipeUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get recipe_users_update_url
    assert_response :success
  end

end
