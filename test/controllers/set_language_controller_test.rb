require "test_helper"

class SetLanguageControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  # проверяем переключение на английскую локаль
  test "should get english" do
    get set_language_english_url
    assert_response :redirect
  end

  # проверяем переключение на русскую локаль
  test "should get russian" do
    get set_language_russian_url
    assert_response :redirect
  end
end
