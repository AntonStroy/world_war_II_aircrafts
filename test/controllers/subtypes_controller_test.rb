require "test_helper"

class SubtypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subtypes_index_url
    assert_response :success
  end

  test "should get show" do
    get subtypes_show_url
    assert_response :success
  end
end
