# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagingProviderFactory, type: :service do
  describe '.create' do
    it 'creates a FacebookWhatsappProvider' do
      provider = described_class.create(provider: 'facebook', channel_type: 'whatsapp', config: {})
      expect(provider).to be_a(MessagingProviders::FacebookWhatsappProvider)
    end
  end
end
