# frozen_string_literal: true

require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # проверка корректного сохранения комнаты
  test 'correct save' do
    instance = Room.new(name: 'Room 1')
    assert instance.save
  end

  # проверка корректного доступа к полям записи
  test 'correct read' do
    instance = Room.new(name: 'Room 1')
    assert_equal('Room 1', instance.name)
  end

  # проверка корректного удаления записи
  test 'correct delete' do
    instance = Room.new(name: 'Room 1')
    assert instance.destroy
  end
end
