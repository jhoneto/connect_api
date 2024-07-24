# frozen_string_literal: true

class OutgoingMessageFactory
  def self.create(payload)
    payload = payload.with_indifferent_access
    case payload[:type]
    when 'template'
      OutgoingMessages::TemplateOutgoingMessage.new(payload['template'])
    else
      raise ArgumentError, "Unknown message type: #{payload[:type]}"
    end
  end
end