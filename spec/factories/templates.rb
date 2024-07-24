# frozen_string_literal: true

FactoryBot.define do
  factory :template do
    name { 'Template name' }
    content { 'Template content' }
    status { 'draft' }
    channel_code { 'channel-code' }
    callback_method { 'callback-method' }
    callback_url { 'callback-url' }
    callback_headers { { 'header-key' => 'header-value' } }
    channel
    organization
  end
end