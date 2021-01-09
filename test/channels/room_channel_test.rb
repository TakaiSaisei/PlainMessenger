# frozen_string_literal: true

require 'test_helper'

class RoomChannelTest < ActionCable::Channel::TestCase
  # проверка подписки
  test 'subscribes and stream for room' do
    subscribe room: '1'
    assert subscription.confirmed?
  end
end
