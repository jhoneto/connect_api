# frozen_string_literal: true

class ProcessOutgoingMessageJob < ApplicationJob
  queue_as :outgoing_message

  def perform(outgoing_message_id)
    outgoing_message = OutgoingMessage.find(outgoing_message_id)
    channel = find_channel(outgoing_message)
    template = find_template(outgoing_message)
    response =send_message(channel, template, outgoing_message)

    outgoing_message.provider_message_id = response
    outgoing_message.processed = true
    #outgoing_message.sended_at = Time.zone.now
    outgoing_message.save!
  rescue StandardError => e
    outgoing_message.last_error = e.message
    outgoing_message.save!
  end

  private

  def create_translate_service(outgoing_message)
    OutgoingMessageFactory.create(outgoing_message.payload)
  end

  def find_channel(outgoing_message)
    Channel.find(outgoing_message.channel_id)
  end

  def find_template(outgoing_message)
    outgoing_message.template_id ? Template.find(outgoing_message.template_id) : nil
  end

  def create_provider_service(channel)
    MessagingProviderFactory.create(
      provider: channel.provider,
      channel_type: channel.channel_type,
      config: channel.config
    )
  end

  def send_message(channel, template, outgoing_message)
    translate_service = create_translate_service(outgoing_message)
    provider_service = create_provider_service(channel)

    if outgoing_message.payload['type'] == 'template'
      template_message(provider_service,translate_service, template)
    else
      simple_message(provider_service,translate_service)
    end
  end

  def simple_message(provider_service, translate_service)
    nil
  end

  def template_message(provider_service, translate_service, template)
    provider_service.send_message_from_template(translate_service.translate(template.channel_code))
  end
end
