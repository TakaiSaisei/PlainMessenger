# frozen_string_literal: true

require 'test_helper'

class SendMessageJobTest < ActiveJob::TestCase

  setup do
    @message = messages(:one)
  end

  # проверяем успешное выполнение
  def test_jobs
    assert_no_performed_jobs
    perform_enqueued_jobs do
      SendMessageJob.perform_later(@message)
      assert_performed_jobs 1
    end
  end

end
