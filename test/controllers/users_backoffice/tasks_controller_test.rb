require 'test_helper'

class UsersBackoffice::TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_backoffice_tasks_edit_url
    assert_response :success
  end

  test "should get create" do
    get users_backoffice_tasks_create_url
    assert_response :success
  end

  test "should get update" do
    get users_backoffice_tasks_update_url
    assert_response :success
  end

  test "should get task_params" do
    get users_backoffice_tasks_task_params_url
    assert_response :success
  end

end
