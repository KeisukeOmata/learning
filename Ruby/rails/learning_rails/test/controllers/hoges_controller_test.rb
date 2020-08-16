require 'test_helper'

class HogesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hoges_index_url
    assert_response :success
  end

end
