# frozen_string_literal: true

require 'application_system_test_case'

class MessagesTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
    @room = rooms(:one)
  end

  # проверка корректной отправки сообщения
  test 'sending a message' do
    visit rooms_url
    click_on @room.name

    fill_in 'Введите ваше сообщение здесь...', with: 'Message test'
    click_on 'Отправить'

    assert_text 'Message test'
  end
end
