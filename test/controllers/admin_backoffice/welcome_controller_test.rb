require "test_helper"

class AdminBackoffice::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_backoffice_welcome_index_url
    assert_response :success
  end
end
