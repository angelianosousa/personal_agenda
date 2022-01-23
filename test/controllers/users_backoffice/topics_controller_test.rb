require 'test_helper'

class UsersBackoffice::TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_backoffice_topics_edit_url
    assert_response :success
  end

end
