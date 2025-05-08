require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get methodology" do
    get pages_methodology_url
    assert_response :success
  end

  test "should get actions" do
    get pages_actions_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end
end
