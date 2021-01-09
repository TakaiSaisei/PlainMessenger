# frozen_string_literal: true

require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  # логинимся и получаем нужную страницу
  test 'should get index' do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    get rooms_url
    assert_response :success
  end

  # не логинимся и перенаправляемся на страницу логина
  test 'redirect to login' do
    get rooms_url
    assert_response :redirect
    assert_redirected_to '/users/sign_in'
  end
end
