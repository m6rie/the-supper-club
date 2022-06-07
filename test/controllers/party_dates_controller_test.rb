require "test_helper"

class PartyDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get party_dates_index_url
    assert_response :success
  end

  test "should get create" do
    get party_dates_create_url
    assert_response :success
  end
end
