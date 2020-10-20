require 'test_helper'

class OriginCountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get origin_countries_index_url
    assert_response :success
  end

  test "should get show" do
    get origin_countries_show_url
    assert_response :success
  end

end
