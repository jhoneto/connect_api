# frozen_string_literal: true
class MessagingProviders::BaseProvider
  def initialize(provider:, channel_type:, config:)
    @provider = provider
    @channel_type = channel_type
    @config = config
  end

  def send_message_from_template(params)
    raise NotImplementedError
  end

end