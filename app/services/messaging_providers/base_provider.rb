# frozen_string_literal: true

class MessagingProviders::BaseProvider
  def initialize(provider:, channel_type:, config:)
    @provider = provider
    @channel_type = channel_type
    @config = config.deep_symbolize_keys
  end

  def send_message_from_template(params)
    raise NotImplementedError
  end

  private

  def read_response(response)
    raise StandardError, response.body unless response.success?

    JSON.parse(response.body)
  end
end
