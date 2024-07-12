# frozen_string_literal: true

FactoryBot.define do
  factory :channel do
    name { Faker::Name.name }
    provider { 'facebook' }
    channel_type { 'whatsapp' }
    callback_url { 'https://example.com' }
    callback_method { 'POST' }
    organization
  end
end
