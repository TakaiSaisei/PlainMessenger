# frozen_string_literal: true

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # проверка корректного сохранения сообщения
  test 'correct save' do
    instance = Message.new(content: 'Test message', user_id: users(:one).id, room_id: rooms(:one).id)
    assert instance.save
  end

  # проверка доступа к полю сохраненной записи
  test 'correct read' do
    instance = Message.new(content: 'Test message', user_id: users(:one).id, room_id: rooms(:one).id)
    assert_equal('Test message', instance.content)
  end

  # проверка корректного удаления записи
  test 'correct delete' do
    instance = Message.new(content: 'Test message', user_id: users(:one).id, room_id: rooms(:one).id)
    assert instance.destroy
  end

  # пытаемся создать запись, принадлежащую несуществующему пользователю
  test 'incorrect user_id' do
    instance = Message.new(content: 'Test message', user_id: 100, room_id: rooms(:one).id)
    assert_equal(false, instance.validate)
  end

  # пытаемся создать запись, принадлежащую несуществующей комнате
  test 'incorrect room_id' do
    instance = Message.new(content: 'Test message', user_id: users(:one).id, room_id: 100)
    assert_equal(false, instance.validate)
  end
end
