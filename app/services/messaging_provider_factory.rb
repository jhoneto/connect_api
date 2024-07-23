# frozen_string_literal: true

class MessagingProviderFactory
  def self.create(provider:, channel_type:, config:)
    Object.const_get("MessagingProviders::#{provider.capitalize}#{channel_type.capitalize}Provider").new(
      provider:, channel_type:, config:
    )
  end
end
