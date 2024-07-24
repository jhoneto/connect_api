# frozen_string_literal: true

FactoryBot.define do
  factory :outcoming_message do
    organization
    channel
    payload { {type: 'text', text: 'Hello World'} }
    last_error { nil }
    proccessed { false }
  end
end
