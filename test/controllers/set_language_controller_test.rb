require "test_helper"

class SetLanguageControllerTest < ActionDispatch::IntegrationTest
  test "should get english" do
    get set_language_english_url
    assert_response :success
  end

  test "should get russian" do
    get set_language_russian_url
    assert_response :success
  end
end
