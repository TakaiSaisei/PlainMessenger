require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  # логинимся, заходим в комнату, выходим из аккаунта
  test 'should login, access room and logout' do
    sign_in users(:one)
    get "/rooms/#{rooms(:one).id}"
    assert_response :success
    delete '/users/sign_out'
    assert_response :redirect
    assert_redirected_to root_url
  end
end