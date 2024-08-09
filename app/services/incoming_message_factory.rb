# frozen_string_literal: true

class IncomingMessageFactory
  def self.create(provider:, channel_type:, payload:)
    payload = payload.with_indifferent_access
    Object.const_get("IncomingMessages::#{provider.capitalize}#{channel_type.capitalize}Message").new(payload)
  end
end
