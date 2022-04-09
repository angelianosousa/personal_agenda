require 'test_helper'

class UsersBackoffice::CalendarEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_backoffice_calendar_events_index_url
    assert_response :success
  end

end
