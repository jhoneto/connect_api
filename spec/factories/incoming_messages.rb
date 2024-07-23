# frozen_string_literal: true

FactoryBot.define do
  factory :incoming_message do
    organization
    provider { 'facebook' }
    channel_type { 'whatsapp' }
    payload { {} }
    channel_infos { {} }
    last_error { nil }
    proccessed { false }
  end
end
