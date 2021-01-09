# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # проверка корректного сохранения записи
  test 'correct save' do
    instance = User.new(username: 'TestUser', email: 'testmail@mail.com', password: 'testpass')
    assert instance.save
  end

  # проверка корректного доступа к полям записи
  test 'correct get' do
    instance = User.new(username: 'TestUser', email: 'testmail@mail.com', password: 'testpass')
    assert_equal('TestUser', instance.username)
  end

  # проверка корректного удаления записи
  test 'correct destroy' do
    instance = User.new(username: 'TestUser', email: 'testmail@mail.com', password: 'testpass')
    instance.save
    assert instance.destroy
  end

  # проверка на выдачу ошибки при попытке создания записи с неуникальным полем email
  test 'error not uniq email' do
    f_instance = User.new(username: 'TestUser', email: 'testmail@mail.com', password: 'testpass')
    f_instance.save
    s_instance = User.new(username: 'TestUser', email: 'testmail@mail.com', password: 'testpass')
    s_instance.validate
    assert_equal(['has already been taken'] || ['уже существует'], s_instance.errors[:email])
  end

  # проверка на выдачу ошибки при попытке создания записи с невалидным полем email
  test 'error invalid email' do
    instance = User.new(username: 'TestUser', email: 'testmail.com', password: 'testpass')
    instance.validate
    assert_equal(['is invalid'] || ['имеет неверное значение'], instance.errors[:email])
  end

  # проверка на выдачу ошибки при попытке создания записи со слишком коротким полем password
  test 'error short password' do
    instance = User.new(username: 'TestUser', email: 'testmail@mail.com', password: '123')
    instance.validate
    assert_equal(
      ['is too short (minimum is 6 characters)'] || ['недостаточной длины (не может быть меньше 6 символов)'], instance.errors[:password]
    )
  end

  # проверка на выдачу ошибки при попытке создания записи с пустым полем username
  test 'error username blank' do
    instance = User.new(email: 'testmail@mail.com', password: 'testpass')
    instance.validate
    assert_equal(['can\'t be blank'] || ['не может быть пустым'], instance.errors[:username])
  end

  # проверка на выдачу ошибки при попытке создания записи со пустым полем email
  test 'error email blank' do
    instance = User.new(username: 'TestUser', password: 'testpass')
    instance.validate
    assert_equal(['can\'t be blank'] || ['не может быть пустым'], instance.errors[:email])
  end

  # проверка на выдачу ошибки при попытке создания записи с пустым полем password
  test 'error password blank' do
    instance = User.new(username: 'TestUser', email: 'testmail@mail.com')
    instance.validate
    assert_equal(['can\'t be blank'] || ['не может быть пустым'], instance.errors[:password])
  end
end
