# frozen_string_literal: true

class RoomChannel < ApplicationCable::Channel
  def subscribed
    channel = Room.find_by(params[:room_id])

    if channel
      stream_from "room_channel_#{channel}"
    else
      reject
    end
  end

  def unsubscribed
    stop_all_streams
  end
end
