require 'test_helper'

class UsersBackoffice::SubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_backoffice_subjects_index_url
    assert_response :success
  end

end
