# frozen_string_literal: true

class Notification::OutgoingMessageStatusChangedJob < ApplicationJob
  queue_as :notification

  def perform(outgoing_message_id, status, timestamp)
    outgoing_message = OutgoingMessage.find(outgoing_message_id)

    Notifications::BaseNotification.new(
      method: outgoing_message.method,
      headers: outgoing_message.headers,
      url: outgoing_message.url,
      payload: {
        message_id: outgoing_message.uuid,
        status: status,
        timestamp: timestamp
      }.to_json
    ).send
  end
end