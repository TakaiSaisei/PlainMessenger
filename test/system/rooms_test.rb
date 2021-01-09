# frozen_string_literal: true

require 'application_system_test_case'

class RoomsTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
  end

  # проверка загрузки страницы
  test 'visiting the index' do
    visit rooms_url
    assert_text 'Выйти'
  end

  # проверка создания комнаты
  test 'creating a room' do
    visit rooms_url
    fill_in 'Название', with: 'Room test'
    click_on 'Создать комнату'

    assert_text 'Room test'
  end

end
