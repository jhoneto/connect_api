# frozen_string_literal: true

class ProcessIncomingMessageJob < ApplicationJob
  queue_as :incoming_message

  def perform(incoming_message_id)
    incoming_message = IncomingMessage.find(incoming_message_id)
    translated_message = process_incoming_message(incoming_message)

    process_status_message(translated_message) if translated_message.event  == 'status'

    incoming_message.update(processed: true)

  end

  private

  def process_incoming_message(incoming_message)
    factory = IncomingMessageFactory.create(
      provider: incoming_message.provider,
      channel_type: incoming_message.channel_type,
      payload: incoming_message.payload
    )

    factory.translate
  end

  def process_status_message(message)
    outgoing_message = OutgoingMessage.find_by(provider_message_id: message.status.provider_message_id)

    return if outgoing_message.blank?

    case message.status.name.to_sym
    when :read
      outgoing_message.update(read_at: DateTime.strptime(message.status.timestamp.to_s, '%s'))
    when :sent
      outgoing_message.update(sended_at: DateTime.strptime(message.status.timestamp.to_s, '%s'))
    when :delivered
      outgoing_message.update(delivered_at: DateTime.strptime(message.status.timestamp.to_s, '%s'))
    end
  end

  def notify_status_change(outgoing_message)

  end
end