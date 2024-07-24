# frozen_string_literal: true

class OutgoingMessages::BaseOutgoingMessage
  attr_reader :payload

  def initialize(payload)
    @payload = payload.with_indifferent_access
  end

  def translate
    raise NotImplementedError
  end
end