# frozen_string_literal: true

FactoryBot.define do
  factory :incoming_message do
    organization
    provider { 'facebook' }
    channel_type { 'whatsapp' }
    payload { {text: 'hello'} }
    last_error { nil }
    processed { false }
  end
end
