# frozen_string_literal: true

FactoryBot.define do
  factory :outgoing_message do
    organization
    channel
    payload { { type: 'text', text: 'Hello World' } }
    last_error { nil }
    processed { false }
  end
end
